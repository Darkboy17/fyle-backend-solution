
# Fyle Backend Challenge Solution

## How to access the back-end API?

 1. Visit this link below:
	https://54b8-2405-201-ac04-e101-4aee-2b80-ee94-673c.ngrok-free.app
	
 2. Use Postman or Curl Command to test the following endpoint

	For example : 
	
	https://54b8-2405-201-ac04-e101-4aee-2b80-ee94-673c.ngrok-free.app/principal/assignments/
	
	is a get request that basically does the following:

### GET /principal/assignments

List all submitted and graded assignments
```
headers:
X-Principal: {"user_id":5, "principal_id":1}

response:
{
    "data": [
        {
            "content": "ESSAY T1",
            "created_at": "2021-09-17T03:14:01.580126",
            "grade": null,
            "id": 1,
            "state": "SUBMITTED",
            "student_id": 1,
            "teacher_id": 1,
            "updated_at": "2021-09-17T03:14:01.584644"
        }
    ]
}

```
