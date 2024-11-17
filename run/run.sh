#!/bin/zsh

if [[ -z "$OPENAI_API_KEY" ]]; then
  echo "Error: OPENAI_API_KEY is not set. Please set the API key and try again."
  exit 1
fi

python src/openai/api_request_parallel_processor.py \
  --requests_filepath local_data/api_requests_for_annotated_dataset.jsonl\
  --save_filepath local_data/api_responses_for_annotated_dataset.jsonl \
  --request_url https://api.openai.com/v1/chat/completions \
  --api_key $OPENAI_API_KEY \
  --max_requests_per_minute 500 \
  --max_tokens_per_minute 200000 \
  --max_attempts 5 \
  --logging_level 20