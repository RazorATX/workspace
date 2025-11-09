# XML Documentation Build System
# Uses xmlto to convert XML files to HTML

# Directories
SRC_DIR = .
OUT_DIR = build

# DocBook XSL path (Homebrew installation)
DOCBOOK_XSL = /opt/homebrew/Cellar/docbook-xsl/1.79.2_1/docbook-xsl

# Optional: specify a single file to build (e.g., make build FILE=myfile.xml)
ifdef FILE
	XML_FILES = $(FILE)
else
	XML_FILES = $(wildcard $(SRC_DIR)/*.xml)
endif

# Default target
.PHONY: help
help:
	@echo "XML Documentation Build System"
	@echo ""
	@echo "Available commands:"
	@echo "  make build           - Build all XML files to single-page HTML"
	@echo "  make build FILE=name - Build specific XML file"
	@echo "  make site            - Build multi-page site with navigation"
	@echo "  make docs            - Build complete docs portal with all guides"
	@echo "  make clean           - Remove build directory"
	@echo "  make rebuild         - Clean and build all"
	@echo "  make install         - Install required tools (xmlto)"
	@echo ""
	@echo "Examples:"
	@echo "  make build FILE=sample-documentation.xml"
	@echo "  make site FILE=user-guide.xml"
	@echo "  make docs"
	@echo ""

# Build XML to HTML
.PHONY: build
build:
	@echo "Building XML documentation..."
	@mkdir -p $(OUT_DIR)
	@if [ -z "$(XML_FILES)" ]; then \
		echo "No XML files found in $(SRC_DIR)"; \
	else \
		for file in $(XML_FILES); do \
			echo "Processing $$file..."; \
			basename=$$(basename $$file .xml); \
			xsltproc --nonet --output $(OUT_DIR)/$$basename.html \
				$(DOCBOOK_XSL)/html/docbook.xsl $$file && \
			echo "✓ Built $$basename.html" || \
			echo "✗ Failed to process $$file"; \
		done; \
		echo "Build complete! Output in $(OUT_DIR)/"; \
	fi

# Clean build artifacts
.PHONY: clean
clean:
	@echo "Cleaning build directory..."
	@rm -rf $(OUT_DIR)
	@echo "Clean complete!"

# Build multi-page site with navigation and sidebar (chunked HTML)
.PHONY: site
site:
	@echo "Building multi-page documentation site with sidebar..."
	@mkdir -p $(OUT_DIR)
	@if [ -z "$(XML_FILES)" ]; then \
		echo "No XML files found in $(SRC_DIR)"; \
	else \
		for file in $(XML_FILES); do \
			echo "Processing $$file..."; \
			basename=$$(basename $$file .xml); \
			mkdir -p $(OUT_DIR)/$$basename; \
			xsltproc --nonet \
				--stringparam base.dir $(OUT_DIR)/$$basename/ \
				custom-docbook.xsl $$file && \
			cp docs-style.css $(OUT_DIR)/$$basename/ && \
			echo "✓ Built site in $(OUT_DIR)/$$basename/" || \
			echo "✗ Failed to process $$file"; \
		done; \
		echo "Site build complete! Open $(OUT_DIR)/<basename>/index.html"; \
	fi

# Build complete documentation portal with landing page and all guides
.PHONY: docs
docs:
	@echo "Building complete documentation portal..."
	@mkdir -p $(OUT_DIR)
	@echo "Building Getting Started Guide..."
	@mkdir -p $(OUT_DIR)/getting-started-guide
	@xsltproc --nonet \
		--stringparam base.dir $(OUT_DIR)/getting-started-guide/ \
		custom-docbook.xsl getting-started-guide.xml 2>/dev/null && \
	cp docs-style.css $(OUT_DIR)/getting-started-guide/
	@echo "✓ Getting Started Guide built"
	@echo "Building User Guide..."
	@mkdir -p $(OUT_DIR)/user-guide
	@xsltproc --nonet \
		--stringparam base.dir $(OUT_DIR)/user-guide/ \
		custom-docbook.xsl user-guide.xml 2>/dev/null && \
	cp docs-style.css $(OUT_DIR)/user-guide/
	@echo "✓ User Guide built"
	@echo "Building API Reference..."
	@mkdir -p $(OUT_DIR)/api-reference
	@xsltproc --nonet \
		--stringparam base.dir $(OUT_DIR)/api-reference/ \
		custom-docbook.xsl api-reference.xml 2>/dev/null && \
	cp docs-style.css $(OUT_DIR)/api-reference/
	@echo "✓ API Reference built"
	@echo "Copying landing page..."
	@cp landing-page.html $(OUT_DIR)/index.html
	@cp landing-style.css $(OUT_DIR)/
	@echo "✓ Landing page copied"
	@echo ""
	@echo "================================================"
	@echo "✅ Documentation portal built successfully!"
	@echo "================================================"
	@echo "Open: $(OUT_DIR)/index.html"
	@echo ""

# Rebuild (clean + build)
.PHONY: rebuild
rebuild: clean build
	@echo "Rebuild complete!"

# Install dependencies (macOS with Homebrew)
.PHONY: install
install:
	@echo "Installing xmlto..."
	@which brew > /dev/null || (echo "Homebrew not found. Install from https://brew.sh" && exit 1)
	@brew install xmlto docbook-xsl
	@echo "Installation complete!"
