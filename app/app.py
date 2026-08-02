from flask import Flask, render_template, request, redirect, url_for, jsonify

app = Flask(__name__)

tasks = [
    {"id": 1, "title": "Setup Linux Environment", "status": "Done"},
    {"id": 2, "title": "Build TaskFlow Application", "status": "In Progress"}
]

@app.route('/')
def index():
    return render_template('index.html', tasks=tasks)

@app.route('/add', methods=['POST'])
def add_task():
    title = request.form.get('title')
    if title:
        new_task = {"id": len(tasks) + 1, "title": title, "status": "Pending"}
        tasks.append(new_task)
    return redirect(url_for('index'))

@app.route('/health')
def health():
    return jsonify({"status": "healthy", "service": "TaskFlow App"}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
