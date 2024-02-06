# Routes
This file explains all of the routes for the mobile and web API.

## Formatting
All data needs to be sent in JSON and all data will be received in JSON.

Any "Date" objects - sent or recieved, should be in ISO8601 format (`yyyy-MM-dd{T}HH:mm:ss.SSS{Z}` where anything inside {} is a constant). 

## Mobile

### Authentication
```
POST /api/signup
firstName: String
lastName: String
email: String
studentID: INT

Returns: {success: Bool, msg: String}
``````

```
POST /api/verify
email: String
token: String
password: String
passwordConfirm: String

Returns: {success: Bool, msg: String} - if success is true, msg is a JWT
``````

```
POST /api/login
email: String
password: String

Returns: {success: Bool, msg: String} - if success is true, msg is a JWT
``````

```
POST /api/logOutAll

Returns: {success: Bool, msg: String}
``````


### Data
**Important:** To receive data, all requests to an API must have an `Authorization: Bearer {token}` header. Without it or if the token is invalid, a 404 will be returned.

```
POST /api/profile

Returns: {name: String, studentID: Int, points: Int, grade: Int, house: Int} - If grade or house are nil, they will be represented as -1.
```

```
POST /api/events

Returns: [{id: INT, name: String, eventType: String, locationName: String, pointsWorth: INT, startDate: Date, endDate: Date}]
```
Note: will not return events that have already passed.

<!-- ```
POST /api/event
id: INT

Returns: {id: INT, name: String, eventType: String, locationName: String, address: String, pointsWorth: INT, startDate: Date, endDate: Date}
``` -->

## Web

### Authentication
```
POST /signup
firstName: String
lastName: String
email: String

Returns: {success: Bool, msg: String}
```

```
POST /verify
emal: String
token: String
password: String
passwordConfirm: String

Returns: {success: Bool, msg: String}
```


```
POST /login
email: String
password: String
```

### Data
```
POST /admin/api/events
includePast: Bool
filterByName: String - Send "" to not filter.

Returns: [{id: Int, name: String, eventType: String, locationID: Int, locationName: String, pointsWorth: Int, startDate: Date, endDate: Date}]
```

```
POST /admin/api/event/:id

Returns: {id: Int, name: String, description: String, eventType: String, locationID: Int, locationName: String, pointsWorth: Int, startDate: Date, endDate: Date, customImagePath: String}
```

```
POST /admin/api/events/new
name: String
description: String
eventType: String
locationID: Int
pointsWorth: Int
startDate: Date
endDate: Date
customImagePath: String - Use "" for no custom image

Returns {success: Bool, msg: String}
```

```
POST /admin/api/events/edit/:id
name: String
description: String
eventType: String
locationID: Int
pointsWorth: Int
startDate: Date
endDate: Date
customImagePath: String - Use "" for no custom image

Returns {success: Bool, msg: String}
```
