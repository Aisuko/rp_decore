.PHONY: venv install activate run decore-main nq-closed-book debug-mode truthfulqa-eval

venv:
	uv venv .venv --system-site-packages

install:
	uv pip install langdetect immutabledict nltk sacrebleu rouge-score torchao python-dotenv hydra-core omegaconf pandas transformers==4.42.3 wandb datasets

clean:
	rm -rf .venv


decore-main:
	python scripts/main.py experiment=memo_trap/decore_entropy/llama3_8b_instruct decoder.configs.num_retrieval_heads=100

nq-closed-book:
	python scripts/main.py experiment=nq/decore_entropy/llama3_8b_instruct decoder.configs.num_retrieval_heads=10 data.variation=closed_book

debug-mode:
	python scripts/main.py experiment=memo_trap/decore_entropy/llama3_8b_instruct debug=true

truthfulqa-eval:
	python src/metrics/truthfulqa_gen.py --pred_filepath=path/to/truthfulqa_model_prediction.json