from conf import *


class Person(db.Model):
    id = db.Column(db.Integer(), primary_key=True)
    name = db.Column(db.String(512), unique=True)
    age = db.Column(db.Integer())
    height = db.Column(db.Integer())

    def __init__(self, name, age, height):
        self.name = name
        self.age = age
        self.height = height


def data():
    persons = Person.query.all()
   
    result = ["""<style>
        table {font-family: arial, sans-serif;border-collapse: collapse;width: 100%;}
        td, th { border: 1px solid #dddddd;text-align: left;padding: 8px;}
        tr:nth-child(even) {background-color: #dddddd;}
        </style>""", 
        "<h1>People</h1>"
        ]

    result.append("<table><tr><th>Name</th><th>Age</th><th>Heigh</th></tr>")

    for person in persons:
        result.append("<tr><td>%s</td><td>%s</td><td>%s</td></tr>"%(person.name, person.age, person.height))

    result.append("</table>")


    
    return "\n".join(result)


