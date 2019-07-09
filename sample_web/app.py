from conf import *
import person

@app.route('/')
def index():
    return person.data()


if __name__ == '__main__':
    app.run(host='0.0.0.0')

