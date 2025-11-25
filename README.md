# LIMS-X

A lightweight Laboratory Information Management System (LIMS) built with Django to manage biological sample data, projects, and associated metadata.

## Overview

**LIMS-X** is designed to help research teams track, organize, and search biological samples in a structured, user-friendly interface. It supports core LIMS features such as sample submission, metadata tracking, and secure access.

![LIMS-X Architecture Diagram](https://raw.githubusercontent.com/man4ish/LIMS-X/feature/metadata-versioning/images/LIMS-X_Architecture.png)

## Features

* Sample submission form with validation
* Models for Sample, Project, Organism, SampleType, SpecimenSource
* Email notifications on submission
* Authentication (planned)
* Role-based permissions (planned)
* CSV/Excel export
* Search and filter
* Asynchronous task processing with Celery
* REST API endpoints for CRUD operations on samples

## Tech Stack

* **Backend**: Django 5.2 (Python 3.12)
* **Database**: MySQL (configurable)
* **Frontend**: Bootstrap 5 (via templates)
* **Task Queue**: Celery with Redis
* **Deployment**: (Planned) Heroku/DigitalOcean

## Getting Started

### Prerequisites

* Python 3.12+
* MySQL or PostgreSQL (SQLite for testing)
* Redis server
* pip

### Setup Instructions

1. Clone the repo:

   ```bash
   git clone https://github.com/man4ish/lab_data_manager.git
   cd lab_data_manager
   ```

2. Create virtual environment and install dependencies:

   ```bash
   python -m venv venv_sys
   source venv_sys/bin/activate  # On Windows: venv_sys\Scripts\activate
   pip install -r requirements.txt
   ```

3. Apply migrations:

   ```bash
   python manage.py migrate
   ```

4. Start Redis server:

   ```bash
   sudo systemctl start redis-server
   ```

5. Start Celery worker:

   ```bash
   celery -A lab_data_manager worker --loglevel=info
   ```

6. Start Django server:

   ```bash
   python manage.py runserver
   ```

7. Open in browser:

   ```
   http://127.0.0.1:8000/core/samples/new/
   ```

---

### Optional: Create superuser

```bash
python manage.py createsuperuser
```

---

### Project Structure

```bash
lab_data_manager/
├── core/
│   ├── models.py        # Sample, Project, etc.
│   ├── forms.py         # SampleForm
│   ├── views.py         # Form handling and success view
│   ├── urls.py          # App URL patterns
│   ├── tasks.py         # Celery tasks (e.g., trigger_nextflow_pipeline)
│   ├── serializers.py   # DRF serializers
│   ├── templates/core/
│   │   ├── sample_form.html
│   │   └── sample_success.html
├── lab_data_manager/
│   ├── settings.py
│   ├── urls.py
│   ├── celery.py         # Celery configuration
├── manage.py
└── .gitignore
```

---

## REST API Usage

### Create a new sample (POST)

```bash
curl -X POST http://127.0.0.1:8000/api/samples/ \
     -H "Content-Type: application/json" \
     -d '{
           "label": "Patient_C_DNA",
           "description": "DNA sample from Patient C, tissue biopsy",
           "organism": 2,
           "project": 4,
           "sample_type": 2,
           "specimen_source": 3
         }'
```

### Get list of samples (GET)

```bash
curl http://127.0.0.1:8000/api/samples/
```

* Responses are returned in JSON format.
* POST requests automatically trigger Celery tasks if configured.

---

## Testing

```bash
python manage.py test
```

(Test coverage to be added.)

---

## CI/CD Integration

Continuous Integration and Deployment will be added using:

* **GitHub Actions** for automated testing and linting
* Optional **Docker support** for containerized deployment
* Deployment pipeline to platforms like Heroku, Render, or DigitalOcean (planned)

### Planned GitHub Actions Workflow

* Run unit tests on every push
* Check code style with flake8
* Auto-deploy to staging/production branch (optional)

---

### Contact

For suggestions or questions, feel free to reach out at [mandecent.gupta@gmail.com](mailto:mandecent.gupta@gmail.com).
