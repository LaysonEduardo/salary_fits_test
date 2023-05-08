# salary_fits_test


## Decisões de uso (Packages)

Com base na descrição do teste/task essas foram as decisões tomadas quanto aos packages
    
 - UI
    - Rive (facil controle de animações). 
    - show_up_animation (facil controle de animações nos widgets)
   ---

 - Internationalization
    - intl (manipular datas/horarios).
    - intl_utils (gerar arquivos relacionado as traduções).
   ---

 - Localization
    - geolocator (Buscar localização atual).
   ---

 - Dependecy Injection/Navegation
    - flutter_modular (Por conta de exp prévia)
   ---
 - State Management 
    - flutter_bloc (Requisito obrigatório)
   ---
 - HTTP
    - dio (Para demonstrar a implementação de services independentes).
   ---
 - Unit Tests   
    - http_mock_adapter (Para mockar o adaptador HTTP e manipular os retornos).
   --- 

### Regra de negócio e afins

- [] Criar Models necessários
- [x] Integrar Services
- [] Implementar e testar services com Dio.
- [x] Criar integração com Modular.

### Today Infos

- [x] Criar os arquivos e classes referente ao Bloc.
- [] Implementar informações com base no repository/bloc.


### Next Days Infos

- [] Criar arquivos e classes referente ao Bloc.
- [] Implementar informações com base no repository/bloc.

### Tela Settings

- [] Implementar controle de métrica atual (Graus/Celsius)