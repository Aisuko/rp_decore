.PHONY: venv install activate

venv:
	uv venv .venv --system-site-packages

install:
	uv pip install langdetect immutabledict nltk sacrebleu rouge-score torchao python-dotenv hydra-core omegaconf pandas transformers==4.42.3 wandb datasets

clean:
	rm -rf .venv

activate:
	@echo "Run: source .venv/bin/activate"