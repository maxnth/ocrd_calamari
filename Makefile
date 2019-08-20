# '$(PIP_INSTALL)'
PIP_INSTALL = pip install

# '$(GIT_CLONE)'
GIT_CLONE = git clone --depth 1

# BEGIN-EVAL makefile-parser --make-help Makefile

help:
	@echo ""
	@echo "  Targets"
	@echo ""
	@echo "    install          Install ocrd_calamari"
	@echo "    calamari         Clone calamari repo"
	@echo "    calamari_models  Clone calamari_models repo"
	@echo "    calamari/build   pip install calamari"
	@echo ""
	@echo "  Variables"
	@echo ""
	@echo "    PIP_INSTALL  '$(PIP_INSTALL)'"
	@echo "    GIT_CLONE    '$(GIT_CLONE)'"

# END-EVAL

# Install ocrd_calamari
install:
	$(PIP_INSTALL) .

# Clone calamari repo
calamari:
	$(GIT_CLONE) https://github.com/chwick/calamari

# Clone calamari_models repo
calamari_models:
	$(GIT_CLONE) https://github.com/chwick/calamari_models

# pip install calamari
calamari/build: calamari calamari_models
	cd calamari && $(PIP_INSTALL) .
