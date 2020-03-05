# TEST Makefile for getting FASTA headers

FASTA_DIR = data/fasta
HEADER_DIR = output/header

FASTA_FILES = $(wildcard $(FASTA_DIR)/*.fasta)
$(info $$FASTA_FILES = $(FASTA_FILES))

HEADER_FILES = $(patsubst $(FASTA_DIR)/%.fasta, $(HEADER_DIR)/%_header.txt, $(FASTA_FILES))
$(info $$HEADER_FILES = $(HEADER_FILES))

.PHONY: all clean

all: output/summary.txt

$(HEADER_FILES): $(HEADER_DIR)/%_header.txt: $(FASTA_DIR)/%.fasta
	head -n 1 $< > $@

output/summary.txt: $(HEADER_FILES)
	cat $^ > $@

clean:
	rm -f output/summary.txt
	rm -f $(HEADER_FILES)
    



