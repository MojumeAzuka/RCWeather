import UIKit

class WeatherViewController: UIViewController,  UITextFieldDelegate {
    
    
    //    UITextFieldDelegate is a set of optional methods to manage the editing and validation of text in a text field object.
    //    A text field calls the methods of its delegate in response to important changes. You use these methods to validate text that was typed by the user, to respond to specific interactions with the keyboard, and to control the overall editing process. Editing begins shortly before the text field becomes the first responder and displays the keyboard (or its assigned input view). The flow of the editing process is as follows:
    //    Before becoming the first responder, the text field calls its delegate’s textFieldShouldBeginEditing(_:) method. Use that method to allow or prevent the editing of the text field’s contents.
    //    The text field becomes the first responder.
    //    In response, the system displays the keyboard (or the text field’s input view) and posts the keyboardWillShowNotification and keyboardDidShowNotification notifications as needed. If the keyboard or another input view was already visible, the system posts the keyboardWillChangeFrameNotification and keyboardDidChangeFrameNotification notifications instead.
    //    The text field calls its delegate’s textFieldDidBeginEditing(_:) method and posts a textDidBeginEditingNotification notification.
    //    The text field calls various delegate methods during editing:
    //    Whenever the current text changes, it calls the textField(_:shouldChangeCharactersIn:replacementString:) method and posts the textDidChangeNotification notification.
    //    It calls the textFieldShouldClear(_:) method when the user taps the built-in button to clear the text.
    //    It calls the textFieldShouldReturn(_:) method when the user taps the keyboard’s return button.
    //    Before resigning as first responder, the text field calls its delegate’s textFieldShouldEndEditing(_:) method. Use that method to validate the current text.
    //    The text field resigns as first responder.
    //    In response, the system hides or adjusts the keyboard as needed. When hiding the keyboard, the system posts the keyboardWillHideNotification and keyboardDidHideNotification notifications.
    //    The text field calls its delegate’s textFieldDidEndEditing(_:) method and posts a textDidEndEditingNotification notification.
    
    
    
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        //sets the class as a delegate
    }
    
    @IBAction func searchPressed(_ sender: UIButton) {
        searchTextField.endEditing(true)
        //removes the keyboard after editing is done
        print(searchTextField.text!)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        //removes the keyboard after editing is done
        print(searchTextField.text!)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type Something"
            //puts in place a placeholder for the city name
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
        //clears up the textField after editing
    }
    
    
    
}

