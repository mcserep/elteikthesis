#!/usr/bin/make -f

LATEXMK       ?= latexmk
LATEXMKRC     ?= latexmkrc

COMPILER      ?= pdflatex
VIEWER        ?= xdg-open

BUILD_COMMAND ?= $(LATEXMK) --$(COMPILER)
CLEAN_COMMAND ?= $(LATEXMK) --$(COMPILER) -c

THESIS_EN     ?= elteikthesis_en
THESIS_HU     ?= elteikthesis_hu
PROJECTS      ?= $(THESIS_EN) $(THESIS_HU)

OUTPUTS       := $(addsuffix .pdf, $(PROJECTS))
VIEWERS       := $(foreach out, $(OUTPUTS), $(VIEWER) $(out) &>/dev/null;${\n})

ALL_SOURCES   := $(wildcard *.bib *.tex samples_en/*.tex samples_en/*/*.tex samples_en/*/*/*.tex samples_en/*/*/*/*.tex samples_hu/*.tex samples_hu/*/*.tex samples_hu/*/*/*.tex samples_hu/*/*/*/*.tex images/*.* images/*/*.* images/*/*/*.* images/*/*/*/*.*)



default: all
all: thesis

thesis: $(PROJECTS)
.PHONY: default all thesis



.PHONY: $(PROJECTS)
# This creates the targets for "make thesis", etc. to mean the same
# as "make thesis.pdf".
$(PROJECTS): %: %.pdf
clean-projects: $(addsuffix .clean, $(PROJECTS))

# However, we're also using a build directory, so the actual build itself will
# happen to be "make Build/thesis.pdf" to generate the input.
$(addsuffix .pdf, $(PROJECTS)): %.pdf: %.tex $(LATEXMKRC) $(ALL_SOURCES)
	$(BUILD_COMMAND) $<
define CLEAN_COMMANDS
$$(addsuffix .clean, $(1)): %.clean:
	$(CLEAN_COMMAND) $$(basename $$@)
endef
$(foreach CLEANABLE_PROJECT, $(PROJECTS), $(eval $(call CLEAN_COMMANDS, $(CLEANABLE_PROJECT))))



.PHONY: show
show: $(OUTPUTS)
	$(VIEWERS)



.PHONY: clean clean-projects
clean: clean-projects



.PHONY: help
help:
	@echo "Configured projects:           $(PROJECTS)"
	@echo ""
	@echo "Identified source files:"
	@echo "$(foreach e, $(ALL_SOURCES), \t* $(e)\n)"
	@echo ""
	@echo "Automatic target builds:       $(PROJECTS)"
	@echo "Output documents generated for 'all':"
	@echo "$(foreach e, $(OUTPUTS), \t* $(e)\n)"
	@echo ""
	@echo "Extra configuration  =  $(LATEXMKRC)"
	@echo "Build command        =  $(BUILD_COMMAND)"
	@echo "Clean command        =  $(CLEAN_COMMAND)"
	@echo ""
	@echo "Viewer for show      =  $(VIEWER)"
