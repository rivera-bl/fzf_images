{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Keep only 3 images, expire all others",
            "selection": {
                "tagStatus": "any",
                "countType": "imageCountMoreThan",
                "countNumber": 3
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
