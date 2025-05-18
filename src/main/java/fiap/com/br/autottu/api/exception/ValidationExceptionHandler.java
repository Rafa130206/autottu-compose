//package fiap.com.br.autottu.api.exception;
//
//import org.springframework.http.HttpStatus;
//import org.springframework.validation.FieldError;
//import org.springframework.web.bind.MethodArgumentNotValidException;
//import org.springframework.web.bind.annotation.ControllerAdvice;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.bind.annotation.ResponseStatus;
//
//import java.util.HashMap;
//import java.util.Map;
//
//@ControllerAdvice
//public class ValidationExceptionHandler {
//    @ResponseStatus(HttpStatus.BAD_REQUEST)
//    @ResponseBody
//    @ExceptionHandler(MethodArgumentNotValidException.class)
//    public ErrorDTO execptionHandler(MethodArgumentNotValidException ex) {
//        Map<String, String> mapCamposErrados = new HashMap<>();
//
//        ex.getBindingResult().getAllErrors().forEach((error) -> {
//            String fieldName = ((FieldError) error).getField();
//            String errorMessage = error.getDefaultMessage();
//            mapCamposErrados.put(fieldName, errorMessage);
//        });
//
//        return new ErrorDTO(mapCamposErrados);
//    }
//}
//
//
//
//
//
//
//
//
//
//
//

