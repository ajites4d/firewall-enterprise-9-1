# 🔧 Firewall Enterprise 9.1 - API Reference

## 🌐 Base URL

https://api.firewall-enterprise.com/v1

## 🔐 Authentication

### Login
```http
POST /auth/login
Content-Type: application/json

{
  "username": "string",
  "password": "string",
  "mfa_code": "string"
}

Response:
{
  "status": "success",
  "data": {
    "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
    "token_type": "bearer",
    "expires_in": 3600,
    "user": {
      "id": "user_2x8Q9pLk3M",
      "email": "user@company.com",
      "role": "security_analyst"
    }
  }
}

🛡️ Threat Intelligence

Check Threat
POST /threat/intel
Authorization: Bearer {access_token}
Content-Type: application/json

{
  "target": "8.8.8.8",
  "type": "ip_address"
}

Response:
{
  "status": "success",
  "data": {
    "target": "8.8.8.8",
    "type": "ip_address",
    "threat_score": 15,
    "risk_level": "low",
    "categories": ["public_dns"],
    "last_updated": "2024-01-15T10:30:00Z"
  }
}

🧠 Behavioral Analysis

Analyze Behavior
POST /behavior/analyze
Authorization: Bearer {access_token}
Content-Type: application/json

{
  "entity_id": "user_2x8Q9pLk3M",
  "behavior_vector": {
    "login_pattern": "normal",
    "access_hours": "9-17",
    "resource_access": ["database", "api"]
  }
}

Response:
{
  "status": "success",
  "data": {
    "entity_id": "user_2x8Q9pLk3M",
    "risk_score": 72,
    "risk_level": "medium",
    "anomalies_detected": ["unusual_access_time"]
  }
}

🔒 Zero-Trust

Evaluate Access
POST /zero-trust/evaluate
Authorization: Bearer {access_token}
Content-Type: application/json

{
  "entity_id": "user_2x8Q9pLk3M",
  "resource": "production_database",
  "action": "read",
  "context": {
    "time": "2024-01-15T02:30:00Z",
    "location": "Russia",
    "device": "unknown_device"
  }
}

Response:
{
  "status": "success",
  "data": {
    "access_granted": false,
    "confidence": 0.92,
    "reasons": ["unusual_location", "off_hours_access"]
  }
}

📊 System Monitoring

System Status
GET /system/status
Authorization: Bearer {access_token}

Response:
{
  "status": "operational",
  "timestamp": "2024-01-15T10:30:45Z",
  "components": {
    "behavioral_ai": "operational",
    "threat_intel": "operational",
    "zero_trust": "operational"
  }
}

🚨 Alerts

Get Alerts
GET /alerts
Authorization: Bearer {access_token}

Response:
{
  "status": "success",
  "data": {
    "alerts": [
      {
        "id": "alert_8kL3pQ9x2M",
        "severity": "high",
        "title": "Unusual Database Access",
        "timestamp": "2024-01-15T02:30:00Z"
      }
    ]
  }
}

📈 Error Codes


HTTP Code Error Code Description Solution
200 SUCCESS Request completed successfully -
400 BAD_REQUEST Invalid request parameters Check request body and parameters
401 UNAUTHORIZED Authentication required or invalid Provide valid access token
403 FORBIDDEN Insufficient permissions Check user role and permissions
404 NOT_FOUND Resource not found Verify resource ID or endpoint
429 RATE_LIMITED Too many requests Wait and retry later
500 INTERNAL_ERROR Server internal error Contact support team
503 SERVICE_UNAVAILABLE Service temporarily unavailable Retry after few moments

🔄 Rate Limiting

Plan Requests/Hour Burst Limit
Free 1,000 100/minute
Pro 10,000 500/minute
Enterprise 100,000 2,000/minute
