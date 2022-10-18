SHELL=/bin/bash
# DIRS=$$(ls -d */)
DIRS=4ti2Interface Gauss ExamplesForHomalg GaussForHomalg GradedModules HomalgToCAS GradedRingForHomalg IO_ForHomalg LocalizeRingForHomalg MatricesForHomalg RingsForHomalg SCO ToolsForHomalg Modules homalg
ECHO=echo
MAKE=make
MAPLE_PATH=$(shell command -v maple)

all: doc test

docclean:
	-for d in $(DIRS); do $(MAKE) -C $$d docclean; done

test: test_4ti2Interface test_Gauss test_ExamplesForHomalg test_GaussForHomalg test_GradedModules test_HomalgToCAS test_GradedRingForHomalg test_IO_ForHomalg test_LocalizeRingForHomalg test_MatricesForHomalg test_RingsForHomalg test_SCO test_Modules test_homalg

build: build_Gauss

ci-prepare:
	./ci_prepare

ci-test_homalg_packages: ci-test_4ti2Interface ci-test_Gauss ci-test_ExamplesForHomalg ci-test_GaussForHomalg ci-test_GradedModules ci-test_HomalgToCAS ci-test_GradedRingForHomalg ci-test_IO_ForHomalg ci-test_LocalizeRingForHomalg ci-test_MatricesForHomalg ci-test_RingsForHomalg ci-test_SCO ci-test_Modules ci-test_homalg

ci-test_additional_packages: ci-test_alexander ci-test_CAP_project ci-test_D-Modules ci-test_Sheaves ci-test_ToricVarieties ci-test_VirtualCAS

ci-test: ci-test_LoadSheaves ci-test_homalg_packages ci-test_additional_packages
	cd .. && homalg_project/gather_performance_data.py

############################################
build_Gauss:
ifndef GAP_HOME
	$(error environment variable GAP_HOME is not set)
endif
	cd Gauss && ./configure $$GAP_HOME && $(MAKE)

############################################
test_4ti2Interface:
	$(MAKE) -C 4ti2Interface test

test_ExamplesForHomalg:
	$(MAKE) -C ExamplesForHomalg test

test_Gauss:
	$(MAKE) -C Gauss test

test_GaussForHomalg:
	$(MAKE) -C GaussForHomalg test

test_GradedModules:
	$(MAKE) -C GradedModules test

test_HomalgToCAS:
	$(MAKE) -C HomalgToCAS test

test_GradedRingForHomalg:
	$(MAKE) -C GradedRingForHomalg test

test_IO_ForHomalg:
	$(MAKE) -C IO_ForHomalg test

test_LocalizeRingForHomalg:
	$(MAKE) -C LocalizeRingForHomalg test

test_MatricesForHomalg:
	$(MAKE) -C MatricesForHomalg test

test_RingsForHomalg:
	$(MAKE) -C RingsForHomalg test

test_SCO:
	$(MAKE) -C SCO test

test_Modules:
	$(MAKE) -C Modules test

test_homalg:
	$(MAKE) -C homalg test

############################################
ci-test_4ti2Interface:
	$(MAKE) -C 4ti2Interface ci-test

ci-test_Gauss: build_Gauss
	$(MAKE) -C Gauss ci-test

ci-test_ExamplesForHomalg:
	$(MAKE) -C ExamplesForHomalg ci-test

ci-test_GaussForHomalg:
	$(MAKE) -C GaussForHomalg ci-test

ci-test_GradedModules:
	$(MAKE) -C GradedModules ci-test

ci-test_HomalgToCAS:
	$(MAKE) -C HomalgToCAS ci-test

ci-test_GradedRingForHomalg:
	$(MAKE) -C GradedRingForHomalg ci-test

ci-test_IO_ForHomalg:
	$(MAKE) -C IO_ForHomalg ci-test

ci-test_LocalizeRingForHomalg:
	$(MAKE) -C LocalizeRingForHomalg ci-test

ci-test_MatricesForHomalg:
	$(MAKE) -C MatricesForHomalg ci-test

ci-test_RingsForHomalg:
	$(MAKE) -C RingsForHomalg ci-test

ci-test_SCO:
	$(MAKE) -C SCO ci-test

ci-test_Modules:
	$(MAKE) -C Modules ci-test

ci-test_homalg:
	$(MAKE) -C homalg ci-test

############################################
ci-test_LoadSheaves: ci-prepare build
	echo 'Assert( 0, LoadPackage( "Sheaves" ) = true );' | gap --quitonbreak

ci-test_alexander: ci-prepare
	$(MAKE) -C ../alexander ci-test

ci-test_CAP_project: ci-prepare
	/usr/bin/time --quiet --format="%U %S\n%e" --output=../CAP_project/performance.out $(MAKE) -C ../CAP_project ci-test

ci-test_D-Modules: ci-prepare
ifneq ($(MAPLE_PATH),)
	$(MAKE) -C ../D-Modules ci-test
endif

ci-test_Sheaves: ci-prepare
	$(MAKE) -C ../Sheaves ci-test

ci-test_ToricVarieties: ci-prepare
	$(MAKE) -C ../ToricVarieties_project/ToricVarieties ci-test

ci-test_VirtualCAS: ci-prepare
	$(MAKE) -C ../VirtualCAS ci-test

############################################

# BEGIN PACKAGE JANITOR
doc: doc_homalg doc_4ti2Interface doc_ExamplesForHomalg doc_Gauss doc_GaussForHomalg doc_GradedModules doc_GradedRingForHomalg doc_HomalgToCAS doc_IO_ForHomalg doc_LocalizeRingForHomalg doc_MatricesForHomalg doc_Modules doc_RingsForHomalg doc_SCO doc_ToolsForHomalg

doc_homalg:
	$(MAKE) -C homalg doc

doc_4ti2Interface:
	$(MAKE) -C 4ti2Interface doc

doc_ExamplesForHomalg:
	$(MAKE) -C ExamplesForHomalg doc

doc_Gauss:
	$(MAKE) -C Gauss doc

doc_GaussForHomalg:
	$(MAKE) -C GaussForHomalg doc

doc_GradedModules:
	$(MAKE) -C GradedModules doc

doc_GradedRingForHomalg:
	$(MAKE) -C GradedRingForHomalg doc

doc_HomalgToCAS:
	$(MAKE) -C HomalgToCAS doc

doc_IO_ForHomalg:
	$(MAKE) -C IO_ForHomalg doc

doc_LocalizeRingForHomalg:
	$(MAKE) -C LocalizeRingForHomalg doc

doc_MatricesForHomalg:
	$(MAKE) -C MatricesForHomalg doc

doc_Modules:
	$(MAKE) -C Modules doc

doc_RingsForHomalg:
	$(MAKE) -C RingsForHomalg doc

doc_SCO:
	$(MAKE) -C SCO doc

doc_ToolsForHomalg:
	$(MAKE) -C ToolsForHomalg doc

# END PACKAGE JANITOR
