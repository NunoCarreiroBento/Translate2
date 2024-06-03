from flask import Flask, request, jsonify
from googletrans import Translator

app = Flask(__name__)
translator = Translator()

@app.route('/translate', methods=['POST'])
def translate():
    data = request.get_json()
    text = data['text']
    translations = {
        'portuguese': translator.translate(text, dest='pt').text,
        'english': translator.translate(text, dest='en').text,
        'french': translator.translate(text, dest='fr').text
    }
    return jsonify(translations)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')
