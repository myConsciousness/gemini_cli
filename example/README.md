# Gemini CLI

Command line tool to provide generative AI using Google Gemini LLM.

You need your api key to use Google Gemini; see https://ai.google.dev/tutorials/setup

## Install

```bash
dart global activate gemini_cli
```

## Use

```bash
gemini gen --p="Write a story about a magic backpack." --api-key=xxxxxxxxx
```

Or, if you do not want to specify `api-key` every time, add `GEMINI_API_KEY` as the environment variable.

```bash
export GEMINI_API_KEY=xxxxxxxxx
```
