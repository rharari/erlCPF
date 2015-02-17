# erlCPF
Erlang function for checking the CPF number.

CPF is the brazilian federal tax number used to identify a person.

Ex: cpf:isValid("00.000.001-91"). -> true

Ex: cpf:isValid("191"). -> true

Ex: cpf:isValid("190"). -> false
