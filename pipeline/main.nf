#!/usr/bin/env nextflow
// hash:sha256:bd498115cf922495e65daebea5c23530f4d797725a529e61e7e2ce192807c3d9

nextflow.enable.dsl = 1

dynamicrouting_datacube_v0_0_261_to_dynamicrouting_encoding_io_1 = channel.fromPath("../data/dynamicrouting_datacube_v0.0.261/nwb/*", type: 'any', relative: true)
capsule_dynamicrouting_encoding_io_1_to_capsule_dynamicrouting_encoding_fit_2_2 = channel.create()
capsule_dynamicrouting_encoding_fit_2_to_capsule_dynamicrouting_encoding_fit_3_3 = channel.create()
capsule_dynamicrouting_encoding_io_1_to_capsule_dynamicrouting_encoding_fit_3_4 = channel.create()
capsule_dynamicrouting_encoding_fit_3_to_capsule_dynamicrouting_encoding_plot_4_5 = channel.create()
capsule_dynamicrouting_encoding_fit_2_to_capsule_dynamicrouting_encoding_plot_4_6 = channel.create()
capsule_dynamicrouting_encoding_plot_4_to_capsule_filter_pipeline_placeholder_files_5_7 = channel.create()
capsule_dynamicrouting_encoding_fit_3_to_capsule_filter_pipeline_placeholder_files_5_8 = channel.create()
capsule_dynamicrouting_encoding_fit_2_to_capsule_filter_pipeline_placeholder_files_5_9 = channel.create()

// capsule - dynamicrouting-encoding-io
process capsule_dynamicrouting_encoding_io_1 {
	tag 'capsule-3423432'
	container "$REGISTRY_HOST/capsule/d9151629-d8e8-4e5d-b09f-dd763e4694b2"

	cpus 1
	memory '8 GB'

	input:
	val path1 from dynamicrouting_datacube_v0_0_261_to_dynamicrouting_encoding_io_1

	output:
	path 'capsule/results/full/*' into capsule_dynamicrouting_encoding_io_1_to_capsule_dynamicrouting_encoding_fit_2_2
	path 'capsule/results/reduced/*' into capsule_dynamicrouting_encoding_io_1_to_capsule_dynamicrouting_encoding_fit_3_4

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=d9151629-d8e8-4e5d-b09f-dd763e4694b2
	export CO_CPUS=1
	export CO_MEMORY=8589934592

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	ln -s "/tmp/data/dynamicrouting_datacube_v0.0.261/nwb/$path1" "capsule/data/$path1" # id: b59511ab-e888-4f96-8772-5627adc12e31
	ln -s "/tmp/data/dynamicrouting_datacube_v0.0.261/session_table.parquet" "capsule/data/session_table.parquet" # id: b59511ab-e888-4f96-8772-5627adc12e31
	ln -s "/tmp/data/dynamicrouting_datacube_v0.0.261/session_table.csv" "capsule/data/session_table.csv" # id: b59511ab-e888-4f96-8772-5627adc12e31

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-3423432.git" capsule-repo
	mv capsule-repo/code capsule/code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_dynamicrouting_encoding_io_1_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - dynamicrouting-encoding-fit
process capsule_dynamicrouting_encoding_fit_2 {
	tag 'capsule-5184476'
	container "$REGISTRY_HOST/capsule/3f98e032-f938-4959-8577-a28f814dd973"

	cpus 1
	memory '8 GB'

	input:
	path 'capsule/data/' from capsule_dynamicrouting_encoding_io_1_to_capsule_dynamicrouting_encoding_fit_2_2.flatten()

	output:
	path 'capsule/results/outputs/*' into capsule_dynamicrouting_encoding_fit_2_to_capsule_dynamicrouting_encoding_fit_3_3
	path 'capsule/results/outputs/*' into capsule_dynamicrouting_encoding_fit_2_to_capsule_dynamicrouting_encoding_plot_4_6
	path 'capsule/results/outputs/*' into capsule_dynamicrouting_encoding_fit_2_to_capsule_filter_pipeline_placeholder_files_5_9

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=3f98e032-f938-4959-8577-a28f814dd973
	export CO_CPUS=1
	export CO_MEMORY=8589934592

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-5184476.git" capsule-repo
	git -C capsule-repo checkout 13c37cfa40784c24d86fed4e72d99692737b853f --quiet
	mv capsule-repo/code capsule/code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_dynamicrouting_encoding_fit_2_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - dynamicrouting-encoding-fit
process capsule_dynamicrouting_encoding_fit_3 {
	tag 'capsule-5184476'
	container "$REGISTRY_HOST/capsule/3f98e032-f938-4959-8577-a28f814dd973"

	cpus 1
	memory '8 GB'

	input:
	path 'capsule/data/' from capsule_dynamicrouting_encoding_fit_2_to_capsule_dynamicrouting_encoding_fit_3_3.collect()
	path 'capsule/data/' from capsule_dynamicrouting_encoding_io_1_to_capsule_dynamicrouting_encoding_fit_3_4.flatten()

	output:
	path 'capsule/results/outputs/*' into capsule_dynamicrouting_encoding_fit_3_to_capsule_dynamicrouting_encoding_plot_4_5
	path 'capsule/results/outputs/*' into capsule_dynamicrouting_encoding_fit_3_to_capsule_filter_pipeline_placeholder_files_5_8

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=3f98e032-f938-4959-8577-a28f814dd973
	export CO_CPUS=1
	export CO_MEMORY=8589934592

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-5184476.git" capsule-repo
	git -C capsule-repo checkout 13c37cfa40784c24d86fed4e72d99692737b853f --quiet
	mv capsule-repo/code capsule/code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run ${params.capsule_dynamicrouting_encoding_fit_3_args}

	echo "[${task.tag}] completed!"
	"""
}

// capsule - dynamicrouting-encoding-plot
process capsule_dynamicrouting_encoding_plot_4 {
	tag 'capsule-8924646'
	container "$REGISTRY_HOST/capsule/0db4a11f-34ab-4c8c-b8cb-384e0af8c6b7"

	cpus 1
	memory '8 GB'

	input:
	path 'capsule/data/outputs/' from capsule_dynamicrouting_encoding_fit_3_to_capsule_dynamicrouting_encoding_plot_4_5.collect()
	path 'capsule/data/outputs/' from capsule_dynamicrouting_encoding_fit_2_to_capsule_dynamicrouting_encoding_plot_4_6.collect()

	output:
	path 'capsule/results/counts.html' into capsule_dynamicrouting_encoding_plot_4_to_capsule_filter_pipeline_placeholder_files_5_7

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=0db4a11f-34ab-4c8c-b8cb-384e0af8c6b7
	export CO_CPUS=1
	export CO_MEMORY=8589934592

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-8924646.git" capsule-repo
	git -C capsule-repo checkout c4133ae4039a66ea4640b41a7427e6f8c9bcc061 --quiet
	mv capsule-repo/code capsule/code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}

// capsule - filter-pipeline-placeholder-files
process capsule_filter_pipeline_placeholder_files_5 {
	tag 'capsule-5612245'
	container "$REGISTRY_HOST/capsule/2040309f-59a7-4f6a-8ca2-00f426045b98"

	cpus 1
	memory '8 GB'

	publishDir "$RESULTS_PATH", saveAs: { filename -> new File(filename).getName() }

	input:
	path 'capsule/data/' from capsule_dynamicrouting_encoding_plot_4_to_capsule_filter_pipeline_placeholder_files_5_7.collect()
	path 'capsule/data/outputs/' from capsule_dynamicrouting_encoding_fit_3_to_capsule_filter_pipeline_placeholder_files_5_8.collect()
	path 'capsule/data/outputs/' from capsule_dynamicrouting_encoding_fit_2_to_capsule_filter_pipeline_placeholder_files_5_9.collect()

	output:
	path 'capsule/results/*'

	script:
	"""
	#!/usr/bin/env bash
	set -e

	export CO_CAPSULE_ID=2040309f-59a7-4f6a-8ca2-00f426045b98
	export CO_CPUS=1
	export CO_MEMORY=8589934592

	mkdir -p capsule
	mkdir -p capsule/data && ln -s \$PWD/capsule/data /data
	mkdir -p capsule/results && ln -s \$PWD/capsule/results /results
	mkdir -p capsule/scratch && ln -s \$PWD/capsule/scratch /scratch

	echo "[${task.tag}] cloning git repo..."
	git clone "https://\$GIT_ACCESS_TOKEN@\$GIT_HOST/capsule-5612245.git" capsule-repo
	git -C capsule-repo checkout 3862d569fc492ca7aac08da72311230092658241 --quiet
	mv capsule-repo/code capsule/code
	rm -rf capsule-repo

	echo "[${task.tag}] running capsule..."
	cd capsule/code
	chmod +x run
	./run

	echo "[${task.tag}] completed!"
	"""
}
