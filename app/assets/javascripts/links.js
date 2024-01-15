document.addEventListener('DOMContentLoaded', function () {
    // Ocultar campos al cargar la página
    toggleFields();
  
    // Escuchar cambios en el campo de tipo
    $('#link_type').on('change', function () {
      toggleFields();
    });
  
    function toggleFields() {
      // Obtener el valor seleccionado del campo de tipo
      var selectedType = $('#link_type').val();
  
      // Mostrar u ocultar campos basados en el tipo seleccionado
      if (selectedType === 'TemporalLink') {
        $('#expiration_date_field').show();
        $('#expiration_date_field input').prop('disabled', false);
      } else {
        $('#expiration_date_field').hide();
        $('#expiration_date_field input').prop('disabled', true);
      }
  
      if (selectedType === 'PrivateLink') {
        $('#password_field').show();
        $('#password_field input').prop('disabled', false);
      } else {
        $('#password_field').hide();
        $('#password_field input').prop('disabled', true);
      }
    }
  
    // Llamamos a la función una vez al cargar la página para asegurarnos de que los campos estén configurados correctamente
    toggleFields();
  });
  