ALL_VIEWS := \
	cpp-event \
	js-yaml-json \
	java-json \
	libyaml-event \
	nimyaml-event \
	perl5-pegex-event \
	perl5-pm-pl \
	perl5-pm-json \
	perl5-pp-event \
	perl5-syck-pl \
	perl5-syck-json \
	perl5-tiny-pl \
	perl5-tiny-json \
	perl5-xs-pl \
	perl5-xs-json \
	perl6-json \
	perl6-p6 \
	pyyaml-event \
	ruamel-event \
	ruby-json \


#------------------------------------------------------------------------------
build: $(ALL_VIEWS)

$(ALL_VIEWS): data matrix
	@bash -c "printf '%.0s-' {1..80}; echo";
	time ./bin/run-framework-tests $@
	./bin/create-matrix

matrix:
	mkdir -p $@

data:
	git clone https://github.com/yaml/yaml-test-suite -b $@ $@


clean:
	rm -fr data matrix
	git clean -dxf