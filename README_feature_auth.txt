README_FEATURE_AUTH
==================

Branch: feature/auth
Purpose: Demonstrates authentication using JWT tokens in the LIMS-X API, with CRUD operations on Samples, Libraries, and Projects.

---------------------------------------------------------
1. Setting Up
---------------------------------------------------------
1. Activate your virtual environment:
   $ source venv_sys/bin/activate

2. Start Django server:
   $ python manage.py runserver

3. Ensure Celery worker is running (optional for pipeline execution):
   $ celery -A lab_data_manager worker --loglevel=info

---------------------------------------------------------
2. Creating a Token
---------------------------------------------------------
To perform API operations, you need a JWT token for your user.

Example for Technician user:

$ curl -X POST http://127.0.0.1:8000/api/token/ \
    -H "Content-Type: application/json" \
    -d '{"username":"tech","password":"tech123"}'

Response:
{
  "refresh": "<REFRESH_TOKEN>",
  "access": "<ACCESS_TOKEN>"
}

Use the "access" token for API calls.

---------------------------------------------------------
3. Using Token for CRUD Operations
---------------------------------------------------------
### GET Samples
$ curl -X GET http://127.0.0.1:8000/api/samples/ \
    -H "Authorization: Bearer <ACCESS_TOKEN>"

### POST Sample
$ curl -X POST http://127.0.0.1:8000/api/samples/ \
    -H "Authorization: Bearer <ACCESS_TOKEN>" \
    -H "Content-Type: application/json" \
    -d '{
          "label": "API_Test_Sample",
          "description": "Created via REST API",
          "organism": 1,
          "project": 1,
          "sample_type": 1,
          "specimen_source": 1
        }'

### PATCH Sample (Update)
$ curl -X PATCH http://127.0.0.1:8000/api/samples/36/ \
    -H "Authorization: Bearer <ACCESS_TOKEN>" \
    -H "Content-Type: application/json" \
    -d '{"description": "Updated description"}'

### DELETE Sample
$ curl -X DELETE http://127.0.0.1:8000/api/samples/36/ \
    -H "Authorization: Bearer <ACCESS_TOKEN>"

---------------------------------------------------------
4. Fetching Records After Operations
---------------------------------------------------------
After performing operations, fetch the updated records:

$ curl -X GET http://127.0.0.1:8000/api/samples/ \
    -H "Authorization: Bearer <ACCESS_TOKEN>"

Sample Response:
[
  {
    "id": 36,
    "label": "API_Test_Sample",
    "description": "Updated description",
    "organism": 1,
    "project": 1,
    "sample_type": 1,
    "specimen_source": 1
  },
  ...
]

---------------------------------------------------------
5. Notes
---------------------------------------------------------
- Always use the latest valid token.
- Pipeline execution (Celery + Nextflow) can be disabled temporarily if not needed.
- This README is specific to the feature/auth branch.

---------------------------------------------------------
End of README
---------------------------------------------------------
