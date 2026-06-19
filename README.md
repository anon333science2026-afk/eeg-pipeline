> ## ⚠️ WARNING: EXPERIMENTAL TOOL
>
> This tool was built for a specific purpose in mind, and while it does allow you to create
> defined, reproducible experiments — and is very strong at such a case — it was built for
> in-house use, and others using it will almost certainly run into bugs. Work is being done
> to clean it up and make it a robust public tool, but there are no guarantees here. You could
> consider this the **0.0.0** version.

---

# EEG Pipeline

Parent repository for the EEG disease-classification pipeline used in
*"Evaluation Traps in EEG Disease Classification"* (NeurIPS 2026, under double-blind review).

It holds the shared configuration code and orchestration, plus two component submodules,
each of which builds its own container image:

| Component | Submodule | Image |
| --- | --- | --- |
| PySpark ETL / feature extraction | [`eeg-pyspark-pipeline`](https://github.com/anon333science2026-afk/eeg-pyspark-pipeline) | `ghcr.io/anon333science2026-afk/eeg-spark-pipeline` |
| Ray hyperparameter tuner | [`eeg-ray-tuner`](https://github.com/anon333science2026-afk/eeg-ray-tuner) | `ghcr.io/anon333science2026-afk/eeg-ray-tuner` |

Shared at the root: `config_handler.py`, `config-maker.py`, `start-pipelines.py`
(orchestration), and `containers/` (Singularity/SLURM build helpers).

Clone with submodules:

```bash
git clone --recurse-submodules https://github.com/anon333science2026-afk/eeg-pipeline.git
```

The YAML configs and split manifests that drive the pipeline live in the
[`eeg-evaluation-traps`](https://github.com/anon333science2026-afk/eeg-evaluation-traps)
repository, which embeds this repo as its `pipeline/` submodule.

> Full documentation is in progress.
