---
page_title: Register API Guidance
title: Register API Guidance
---

Welcome to the Register API! This API allows you to access information about trainees and provides endpoints to update and create trainee data. 

Below are the available endpoints.

## Endpoints

### GET /info

This endpoint provides general information about the API.

#### Request

`GET /api/v0.1/info`

#### Response
```
Status: 200 OK
{
    // JSON response structure here
}
```

### GET /Trainee

This endpoint retrieves information about trainees.

#### Request

`GET /api/v0.1/trainee`

#### Response

```
Status: 200 OK
{
    // JSON response structure here
}
```