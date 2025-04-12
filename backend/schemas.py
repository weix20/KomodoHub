from marshmallow import Schema, fields, validate

class RegisterSchema(Schema):
    username = fields.Str(required=True, validate=validate.Length(min=3, max=50))
    password = fields.Str(required=True, validate=validate.Length(min=6))
    email = fields.Email(required=False)
    role = fields.Str(required=True, validate=validate.OneOf(['STUDENT', 'TEACHER', 'CONTRIBUTOR', 'ADMIN']))
    full_name = fields.Str(required=False)
    age = fields.Int(validate=validate.Range(min=0, max=150))
    gender = fields.Str(validate=validate.OneOf(['M', 'F', 'OTHER']))
    bio = fields.Str(required=False)
    avatar_url = fields.Url(required=False)

class LoginSchema(Schema):
    username = fields.Str(required=True)
    password = fields.Str(required=True)
