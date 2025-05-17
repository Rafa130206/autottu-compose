package fiap.com.br.autottu.shared.converter;

import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

@Converter(autoApply = true)
public class YesNoBooleanConverter implements AttributeConverter<Boolean, String> {
    @Override
    public String convertToDatabaseColumn(Boolean value) {
        return (value != null && value) ? "Y" : "N";
    }
    @Override
    public Boolean convertToEntityAttribute(String db) {
        return "Y".equalsIgnoreCase(db);
    }
}
