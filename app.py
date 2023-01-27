from flask import Flask, request, jsonify
import fasttext

app = Flask(__name__)
model = fasttext.load_model("lid.176.bin")

@app.route('/', methods=['POST'])
def detect_language():
    text = request.json["text"]
    prediction = model.predict(text)
    return jsonify({"language":prediction[0][0][9:], "confidence":prediction[1][0]})

if __name__ == '__main__':
    app.run(debug=False, host='0.0.0.0', port=5000)
