class Serial():
    def __init__(self):
        pass

    def all_persons(self, persons):
        # print(persons[0]["id"])
        return [{
            "id": i["id"],
            "name": i["name"],
            "age": i["age"]
        } for i in persons]

    def single_person(self, person):
        # print(person)
        return {
            "id": person["id"],
            "name": person["name"],
            "age": person["age"]
        }
