# pdfGPT

pdfGPT is a local, privacy-preserving PDF question-answering app. It allows you to upload PDF documents and interact with them using a conversational AI interface, powered by a local Large Language Model (LLM). All processing and inference are performed locally—no data is sent to external servers.

## Features
- **Upload and chat with your PDFs**: Ask questions about the content of your uploaded PDF files.
- **Local LLM inference**: Uses [LaMini-T5-738M](https://huggingface.co/MBZUAI/LaMini-T5-738M) for generating answers.
- **Embeddings and retrieval**: Utilizes [SentenceTransformers](https://www.sbert.net/) and [ChromaDB](https://www.trychroma.com/) for document chunking and semantic search.
- **Streamlit UI**: Simple, interactive web interface for uploading files and chatting.
- **No cloud required**: All computation is performed on your machine.

## Installation

### Prerequisites
- Python 3.10+
- [Git](https://git-scm.com/)

### Clone the repository
```bash
git clone <repo-url>
cd pdfGPT
```

### Install dependencies
It is recommended to use a virtual environment:
```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
```

## Usage

### 1. Start the App
```bash
streamlit run app.py
```

### 2. Upload and Chat
- Open the Streamlit app in your browser (usually at http://localhost:8501).
- Upload a PDF file using the uploader.
- Wait for embeddings to be created (first time per document).
- Ask questions about your PDF in the chat interface.

## Docker
You can also run pdfGPT in a Docker container:

```bash
docker build -t pdfgpt .
docker run -p 8000:8000 pdfgpt
```
Then visit http://localhost:8000 in your browser.

> **Note:** The default Docker CMD is set to `chatbot_app.py`. If your main file is `app.py`, update the `dockerfile` accordingly:
> ```dockerfile
> CMD ["streamlit", "run", "app.py"]
> ```

## File Structure
- `app.py` — Main Streamlit app
- `ingest.py` — Script for manual PDF ingestion (optional)
- `db/` — Stores ChromaDB vector database
- `docs/` — Place your PDF files here
- `LaMini-T5-738M/` — Local model files (downloaded or placed here)
- `requirements.txt` — Python dependencies

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.