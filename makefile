SHELL=/bin/bash
# DIRS=$$(ls -d */)
DIRS=4ti2Interface Convex Gauss ExamplesForHomalg GaussForHomalg GradedModules HomalgToCAS GradedRingForHomalg IO_ForHomalg LocalizeRingForHomalg MatricesForHomalg PolymakeInterface RingsForHomalg SCO ToolsForHomalg ToricVarieties Modules homalg
ECHO=echo
MAKE=make
POLYMAKE_CONFIG_PATH=$(shell command -v polymake-config)
SINGULAR_PATH=$(shell command -v Singular)
SAGE_PATH=$(shell command -v sage)
M2_PATH=$(shell command -v M2)
MAGMA_PATH=$(shell command -v magma)
MAPLE_PATH=$(shell command -v maple)

all: doc test

doc: doc_4ti2Interface doc_Convex doc_Gauss doc_ExamplesForHomalg doc_GaussForHomalg doc_GradedModules doc_HomalgToCAS doc_GradedRingForHomalg doc_IO_ForHomalg doc_LocalizeRingForHomalg doc_MatricesForHomalg doc_PolymakeInterface doc_RingsForHomalg doc_SCO doc_ToolsForHomalg doc_ToricVarieties doc_Modules doc_homalg

docclean:
	-for d in $(DIRS); do $(MAKE) -C $$d docclean; done

test: test_Convex test_Gauss test_ExamplesForHomalg test_GaussForHomalg test_GradedModules test_HomalgToCAS test_GradedRingForHomalg test_IO_ForHomalg test_LocalizeRingForHomalg test_MatricesForHomalg test_RingsForHomalg test_SCO test_ToolsForHomalg test_ToricVarieties test_Modules test_homalg

build: build_PolymakeInterface build_Gauss

ci-prepare:
	./ci_prepare

ci-run-test_suite: ci-test_test_suite_test_packages_of_homalg_project ci-test_test_suite_main_examples_of_homalg_project

ci-run-tests: ci-test_Gauss ci-test_ExamplesForHomalg ci-test_GaussForHomalg ci-test_GradedModules ci-test_HomalgToCAS ci-test_GradedRingForHomalg ci-test_IO_ForHomalg ci-test_LocalizeRingForHomalg ci-test_MatricesForHomalg ci-test_RingsForHomalg ci-test_SCO ci-test_Modules ci-test_ToolsForHomalg ci-test_homalg ci-run-test_suite

ci-test: ci-prepare doc build
	$(MAKE) ci-run-tests
	./gather_performance_data.py

############################################
doc_4ti2Interface:
	$(MAKE) -C 4ti2Interface doc

doc_Convex:
	$(MAKE) -C Convex doc

doc_Gauss:
	$(MAKE) -C Gauss doc

doc_ExamplesForHomalg:
	$(MAKE) -C ExamplesForHomalg doc

doc_GaussForHomalg:
	$(MAKE) -C GaussForHomalg doc

doc_GradedModules:
	$(MAKE) -C GradedModules doc

doc_HomalgToCAS:
	$(MAKE) -C HomalgToCAS doc

doc_GradedRingForHomalg:
	$(MAKE) -C GradedRingForHomalg doc

doc_IO_ForHomalg:
	$(MAKE) -C IO_ForHomalg doc

doc_LocalizeRingForHomalg:
	$(MAKE) -C LocalizeRingForHomalg doc

doc_MatricesForHomalg:
	$(MAKE) -C MatricesForHomalg doc

doc_PolymakeInterface:
	$(MAKE) -C PolymakeInterface doc

doc_RingsForHomalg:
	$(MAKE) -C RingsForHomalg doc

doc_SCO:
	$(MAKE) -C SCO doc

doc_ToolsForHomalg:
	$(MAKE) -C ToolsForHomalg doc

doc_ToricVarieties:
	$(MAKE) -C ToricVarieties doc

doc_Modules:
	$(MAKE) -C Modules doc

doc_homalg:
	$(MAKE) -C homalg doc

############################################
build_PolymakeInterface:
ifndef GAP_HOME
	$(error environment variable GAP_HOME is not set)
endif
ifneq ($(POLYMAKE_CONFIG_PATH),)
	cd PolymakeInterface && ./configure $$GAP_HOME && $(MAKE)
endif

build_Gauss:
ifndef GAP_HOME
	$(error environment variable GAP_HOME is not set)
endif
	cd Gauss && GAPPATH=$$GAP_HOME ./configure && $(MAKE)

############################################
test_Convex:
	$(MAKE) -C Convex test

test_Gauss:
	$(MAKE) -C Gauss test

test_ExamplesForHomalg:
	$(MAKE) -C ExamplesForHomalg test

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

test_ToolsForHomalg:
	$(MAKE) -C ToolsForHomalg test

test_ToricVarieties:
	$(MAKE) -C ToricVarieties test

test_Modules:
	$(MAKE) -C Modules test

test_homalg:
	$(MAKE) -C homalg test

############################################
ci-test_Convex:
	$(MAKE) -C Convex ci-test

ci-test_Gauss:
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
ifneq ($(SINGULAR_PATH),)
ifneq ($(SAGE_PATH),)
ifneq ($(M2_PATH),)
ifneq ($(MAGMA_PATH),)
ifneq ($(MAPLE_PATH),)
	$(MAKE) -C RingsForHomalg ci-test
endif
endif
endif
endif
endif

ci-test_SCO:
	$(MAKE) -C SCO ci-test

ci-test_ToolsForHomalg:
	$(MAKE) -C ToolsForHomalg ci-test

ci-test_ToricVarieties:
	$(MAKE) -C ToricVarieties ci-test

ci-test_Modules:
	$(MAKE) -C Modules ci-test

ci-test_homalg:
	$(MAKE) -C homalg ci-test

############################################
ci-test_test_suite_test_packages_of_homalg_project:
	exec 9>&1; \
	OUTPUT=$$(cd ../test_suite && ./test_packages_of_homalg_project 2>&1 | tee >(cat - >&9)); \
	! echo "$$OUTPUT" | grep "No such file or directory\|Could not read file\|Error\|from paragraph\|Diff in" > /dev/null

ci-test_test_suite_main_examples_of_homalg_project:
	exec 9>&1; \
	OUTPUT=$$(cd ../test_suite && ./main_examples_of_homalg_project 2>&1 | tee >(cat - >&9)); \
	! echo "$$OUTPUT" | grep "No such file or directory\|Could not read file\|Error\|from paragraph\|Diff in" > /dev/null
