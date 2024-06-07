import re
def extract_session_id(session_str: str):

    match = re.search(r"/session/(.*?)/contexts/", session_str)
    if match:
        extracted_string = match.group(1)
        return extracted_string
    
    return ""

def get_str_from_food_dict(food_dict: dict):
    return ", ".join([f"{int(value)} {key}" for key,value in food_dict.items()])

if __name__=="__main__":
    print(get_str_from_food_dict({"pizza": 2, "pastry": 5}))
    print(extract_session_id("projects/mira-chatbot-9vj9/agent/sessions/f173589a-5473-251b-86aa-b0780adf9cb5/contexts/ongoing-order"))
