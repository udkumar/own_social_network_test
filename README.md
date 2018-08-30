# Own Social Network Test
This application would start with features like "Friend", "Unfriend", "Block", "Receive Updates"



## Technology:
> Ruby, Heroku, postgresql, REST API, Git


## 1. As a user, I need an API to create a friend connection between two email addresses.
### Request URL:
> https://own-social-network.herokuapp.com/users/create_friend

### JSON request:
``` json
{
	"friends":
		[
		'andy@example.com',
		'john@example.com'
		]
}
```

### JSON responses:
``` json
{
	"success": true
}
```

## 2. As a user, I need an API to retrieve the friends list for an email address.
### Request URL:
> https://own-social-network.herokuapp.com/users/all_friends

### JSON request:
``` json
{
	"email": 'andy@example.com'
}
```

### JSON response:
``` json
{
    "success": true,
    "friends": [
        "john@example.com",
        "andy_comman@example.com",
        "comman_friend_andy_john@example.com",
        "john@example.com"
    ],
    "count": 4
}
```

## 3. As a user, I need an API to retrieve the common friends list between two email addresses.
### Request URL:
> https://own-social-network.herokuapp.com/users/common_friends
>> I am working for issue

### JSON request:
``` json
{
	"friends":
		[
		'andy@example.com',
		'john@example.com'
		]
}
```

### JSON response:
``` json
{
    "success": true,
    "friends": [
        "comman_friend_andy_john@example.com"
    ],
    "count": 1
}
```

## 4. As a user, I need an API to subscribe to updates from an email address.
### Request URL:
> https://own-social-network.herokuapp.com/users/subscribe

### JSON request:
``` json
{
	"requestor": "lisa@example.com",
	"target": "john@example.com"
}
```

### JSON response:
``` json
{
	"success": true
}
```
If requester will pass same user again and again then respose will be as below:
``` json
{
    "success": false,
    "message": "Subscription already exist!"
}
```

## 5. As a user, I need an API to block updates from an email address.
### Request URL:
> https://own-social-network.herokuapp.com/users/block

### JSON request:
``` json
{
	"requestor": "andy@example.com",
	"target": "john@example.com"
}

```

### JSON response
``` json
{
	"success": true
}
```

## 6. As a user, I need an API to retrieve all email addresses that can receive updates from an email address.
### Request URL:
> https://own-social-network.herokuapp.com/users/receive_update

### JSON request:
``` json
{
	"sender": "john@example.com",
	"text": "Hello World! kate@example.com"
}

```

## JSON response:
``` json
{
    "sucess": true,
    "receipients": [
        "kate@example.com",
        "lisa@example.com"
    ]
}
```

## Notes: 
[Import in postman chrome ext app](https://github.com/udkumar/own_social_network_test/blob/master/public/Friend_Management.postman_collection.json):

# Author:
[uday Kumar](udkumar@hotmail.com)