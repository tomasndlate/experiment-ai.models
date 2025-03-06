import json
import joblib

CORS_HEADERS = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Methods": "OPTIONS, POST",
    "Access-Control-Allow-Headers": "Content-Type"
}
OPTIONS_RESPONSE = {
    "statusCode": 200,
    "headers": CORS_HEADERS,
    "body": ""
}

MODEL_PATHS = {
    "model_A": "model_A.joblib",
    "model_B": "model_B.joblib"
}
loaded_models = {}


def get_model(model_name):
    """Lazy load a model only when first requested."""
    global loaded_models
    if model_name not in loaded_models:
        if model_name not in MODEL_PATHS:
            return None
        loaded_models[model_name] = joblib.load(MODEL_PATHS[model_name])

    return loaded_models[model_name]


def predict(model_name, text):
    """
    Predict if the text is spam or not
    """

    model_instance = get_model(model_name)
    if model_instance is None:
        return "Model not found"
    
    prediction = model_instance.predict([text])[0]

    return prediction


def handler(event, context):
    """
    AWS Lambda handler function to redict if the text is spam or not
    """

    if 'httpMethod' in event and event["httpMethod"] == "OPTIONS":
        return OPTIONS_RESPONSE

    try:
        body = json.loads(event.get("body", "{}"))  

        model_name = body.get("model_name", "")
        text = body.get("text", "")

        prediction = predict(model_name, text)

        response = {
            "statusCode": 200,
            "headers": CORS_HEADERS,
            "body": json.dumps({
                "input": text,
                "prediction": prediction
            })
        }

        return response
    
    except Exception as e:
        print(str(e))
        response = {
            "statusCode": 500,
            "headers": CORS_HEADERS,
            "body": json.dumps({"error": "Internal server error"})
        }
        return response
