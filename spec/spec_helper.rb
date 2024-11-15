# spec_helper.rb

# Agregar simplecov para la cobertura de pruebas
require 'simplecov'
SimpleCov.start 'rails'

# Esta configuración es generada por el comando `rails generate rspec:install`.
# Convencionalmente, todas las pruebas se encuentran bajo el directorio `spec`,
# lo cual RSpec agrega al `$LOAD_PATH`.
#
# Dado que este archivo siempre se carga, se recomienda mantenerlo lo más liviano posible.
# Requerir dependencias pesadas en este archivo puede aumentar el tiempo de arranque de tu suite de pruebas
# incluso cuando solo se ejecute una prueba individual que no necesite todas esas dependencias.

RSpec.configure do |config|
  # Configuración de rspec-expectations.
  config.expect_with :rspec do |expectations|
    # Esta opción estará activada por defecto en RSpec 4. Permite que la descripción y el mensaje de error
    # de los matchers personalizados incluyan texto para los métodos auxiliares definidos con `chain`, por ejemplo:
    #     be_bigger_than(2).and_smaller_than(4).description
    #     # => "be bigger than 2 and smaller than 4"
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  # Configuración de rspec-mocks.
  config.mock_with :rspec do |mocks|
    # Evita que se mokeen o stubben métodos que no existen en un objeto real.
    mocks.verify_partial_doubles = true
  end

  # Comportamiento de la metadata de contextos compartidos.
  config.shared_context_metadata_behavior = :apply_to_host_groups

  # Configuración adicional de RSpec.
  # Esto permite limitar la ejecución de pruebas a ejemplos o grupos individuales mediante el uso de la metadata `:focus`.
  # Cuando no hay nada etiquetado con `:focus`, todas las pruebas se ejecutan.
  # Si encuentras que las pruebas se ejecutan demasiado rápido, puedes enfocarte solo en el código con `fit` o `fdescribe` para hacer un test más específico.
  config.filter_run_when_matching :focus

  # Permite a RSpec persistir un poco del estado entre ejecuciones para soportar las opciones `--only-failures` y `--next-failure` de la CLI.
  # Se recomienda configurar tu sistema de control de versiones para ignorar este archivo.
  config.example_status_persistence_file_path = "spec/examples.txt"

  # Limita la sintaxis disponible a la sintaxis no modificada que se recomienda. Más detalles en:
  # https://rspec.info/features/3-12/rspec-core/configuration/zero-monkey-patching-mode/
  config.disable_monkey_patching!

  # Esta configuración habilita advertencias. Es recomendada, pero en algunos casos puede generar demasiadas advertencias debido a problemas en las dependencias.
  config.warnings = true

  # Muchos usuarios de RSpec suelen ejecutar toda la suite o un archivo individual, y es útil permitir más salida detallada al ejecutar un archivo de prueba específico.
  if config.files_to_run.one?
    # Usa el formato "documentation" para salida detallada.
    config.default_formatter = "doc"
  end

  # Imprime los 10 ejemplos y grupos de ejemplos más lentos al final de la ejecución de las pruebas, para ayudar a identificar cuáles están tomando más tiempo.
  config.profile_examples = 10

  # Ejecuta las pruebas en un orden aleatorio para identificar dependencias de orden. Si encuentras una dependencia de orden y quieres depurarla, puedes fijar el orden proporcionando la semilla.
  config.order = :random

  # Semilla para la aleatorización global en este proceso.
  Kernel.srand config.seed
end
