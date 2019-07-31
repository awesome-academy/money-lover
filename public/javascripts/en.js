I18n.translations || (I18n.translations = {});
I18n.translations["en"] = I18n.extend((I18n.translations["en"] || {}), {"activerecord":{"errors":{"messages":{"record_invalid":"Validation failed: %{errors}","restrict_dependent_destroy":{"has_many":"Cannot delete record because dependent %{record} exist","has_one":"Cannot delete record because a dependent %{record} exists"}}}},"admin":{"alert":{"no_data":"No data to statistic","no_result":"No data in %{obj} to statistic"},"label":{"enter_year":"Enter year: "},"months":{"_1":"Jan","_10":"Oct","_11":"Nov","_12":"Dec","_2":"Feb","_3":"Mar","_4":"Apr","_5":"May","_6":"Jun","_7":"Jul","_8":"Aug","_9":"Sep"},"stats_by_year":{"_x":"Month","_y":"Users"},"title":{"month_stats":"Statistic User Register by Month","year_stats":"Statistic User Register by Year","year_stats_2":"Statistic Users Register by months in "}},"alert":{"confirm_del":"Are you sure?","created":"%{obj} Created","delete_failed":"%{obj} Delete Failed","deleted":"%{obj} Deleted","error":"error","fail":" Failed","form_contain":"The form contains","not_found":"%{obj} Not Found","updated":"%{obj} Updated","welcome_admin":"Welcome to admin dashboards"},"button":{"back":"Back","back_to_home":"Back to home","close":"Close","delete":"Delete","new":"Add new","save":"Save","save_month_intense":"Save","send_mail":"Send to mail","signup":"Sign up","submit":"Show statistic","update":"Update","update_password":"Update password","view":"View"},"date":{"abbr_day_names":["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],"abbr_month_names":[null,"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"day_names":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],"formats":{"default":"%Y-%m-%d","long":"%B %d, %Y","short":"%b %d"},"month_names":[null,"January","February","March","April","May","June","July","August","September","October","November","December"],"order":["year","month","day"]},"datetime":{"distance_in_words":{"about_x_hours":{"one":"about 1 hour","other":"about %{count} hours"},"about_x_months":{"one":"about 1 month","other":"about %{count} months"},"about_x_years":{"one":"about 1 year","other":"about %{count} years"},"almost_x_years":{"one":"almost 1 year","other":"almost %{count} years"},"half_a_minute":"half a minute","less_than_x_minutes":{"one":"less than a minute","other":"less than %{count} minutes"},"less_than_x_seconds":{"one":"less than 1 second","other":"less than %{count} seconds"},"over_x_years":{"one":"over 1 year","other":"over %{count} years"},"x_days":{"one":"1 day","other":"%{count} days"},"x_minutes":{"one":"1 minute","other":"%{count} minutes"},"x_months":{"one":"1 month","other":"%{count} months"},"x_seconds":{"one":"1 second","other":"%{count} seconds"},"x_years":{"one":"1 year","other":"%{count} years"}},"prompts":{"day":"Day","hour":"Hour","minute":"Minute","month":"Month","second":"Seconds","year":"Year"}},"error":{"content":"The form contains","error":"Error","not_empty":"Not empty"},"errors":{"connection_refused":"Oops! Failed to connect to the Web Console middleware.\nPlease make sure a rails development server is running.\n","format":"%{attribute} %{message}","messages":{"accepted":"must be accepted","blank":"can't be blank","carrierwave_download_error":"could not be downloaded","carrierwave_integrity_error":"is not of an allowed file type","carrierwave_processing_error":"failed to be processed","confirmation":"doesn't match %{attribute}","content_type_blacklist_error":"You are not allowed to upload %{content_type} files","content_type_whitelist_error":"You are not allowed to upload %{content_type} files","empty":"can't be empty","equal_to":"must be equal to %{count}","even":"must be even","exclusion":"is reserved","extension_blacklist_error":"You are not allowed to upload %{extension} files, prohibited types: %{prohibited_types}","extension_whitelist_error":"You are not allowed to upload %{extension} files, allowed types: %{allowed_types}","greater_than":"must be greater than %{count}","greater_than_or_equal_to":"must be greater than or equal to %{count}","inclusion":"is not included in the list","invalid":"is invalid","less_than":"must be less than %{count}","less_than_or_equal_to":"must be less than or equal to %{count}","max_size_error":"File size should be less than %{max_size}","min_size_error":"File size should be greater than %{min_size}","mini_magick_processing_error":"Failed to manipulate with MiniMagick, maybe it is not an image? Original Error: %{e}","model_invalid":"Validation failed: %{errors}","not_a_number":"is not a number","not_an_integer":"must be an integer","odd":"must be odd","other_than":"must be other than %{count}","present":"must be blank","required":"must exist","rmagick_processing_error":"Failed to manipulate with rmagick, maybe it is not an image?","taken":"has already been taken","too_long":{"one":"is too long (maximum is 1 character)","other":"is too long (maximum is %{count} characters)"},"too_short":{"one":"is too short (minimum is 1 character)","other":"is too short (minimum is %{count} characters)"},"wrong_length":{"one":"is the wrong length (should be 1 character)","other":"is the wrong length (should be %{count} characters)"}},"template":{"body":"There were problems with the following fields:","header":{"one":"1 error prohibited this %{model} from being saved","other":"%{count} errors prohibited this %{model} from being saved"}},"unacceptable_request":"A supported version is expected in the Accept header.\n","unavailable_session":"Session %{id} is no longer available in memory.\n\nIf you happen to run on a multi-process server (like Unicorn or Puma) the process\nthis request hit doesn't store %{id} in memory. Consider turning the number of\nprocesses/workers to one (1) or using a different server in development.\n"},"flash":{"created_account":"Created account","email_invalid":"Email not found","invalid_account":"Invalid email or password","no_account":"No account","pass_exp":"Expried","sent_password_reset":"Please check your mail to reset password","success":"Successful","update_fail":"Please rewrite","update_success":"Update Successful"},"header":{"logo":{"_1":"Money","_2":"Lover"},"toggle":"Toggle navigation"},"helpers":{"page_entries_info":{"entry":{"one":"entry","other":"entries","zero":"entries"},"more_pages":{"display_entries":"Displaying %{entry_name} \u003cb\u003e%{first}\u0026nbsp;-\u0026nbsp;%{last}\u003c/b\u003e of \u003cb\u003e%{total}\u003c/b\u003e in total"},"one_page":{"display_entries":{"one":"Displaying \u003cb\u003e1\u003c/b\u003e %{entry_name}","other":"Displaying \u003cb\u003eall %{count}\u003c/b\u003e %{entry_name}","zero":"No %{entry_name} found"}}},"select":{"prompt":"Please select"},"submit":{"create":"Create %{model}","submit":"Save %{model}","update":"Update %{model}"}},"home":"Home","i18n":{"plural":{"keys":["one","other"],"rule":{}}},"mail":{"content_expire":"This link will expire in two hours.","foot":"If you did not request your password to be reset, please ignore this email and your password will stay as it is.","head":"To reset your password click the link below:","password_reset":"password reset"},"menu":{"account":"Account","logout":"Logout","manage_db":"Manage Database","profile":"Profile","stat_user_by_month":"Statistic Users By Month","stat_user_by_year":"Statistic Users By Year","stat_users":"Statistic Users","statistic":"Statistic"},"month_intense":"Setup intent of month","month_report":{"account":"Account","link_page":{"account":"Account","category":"Category","logOut":"Log Out","month_report":"Month Report","move_chart":"*Move to Chart","move_report":"*Move to Report","profile":"Profile","year_report":"Year Report"},"name_chart":{"expense":"Expense","income":"Income"},"name_column":{"amout_col":"Amout","category_col":"Category","income_col":"Income/Expense","name_col":"Name","saving":"Savings","stt_col":"#","sum_expense_col":"Expense's Sum","sum_income_col":"Income's Sum"},"other":{"footer":"RubyTeam 2019 ","toggle":"Toggle navigation"},"title":{"add_transaction":"Add Transaction","amout":"Amout","base":"Money Lover","category":"Category","columnChart":"Income/Expense Column's Chart","lover":"Lover","money":"Money","month_report":"Month's Report","note":"Name","pieChart":"Income/Expense Pie's Chart","time":"Date","transaction":"Transaction"}},"number":{"currency":{"format":{"delimiter":",","format":"%u%n","precision":2,"separator":".","significant":false,"strip_insignificant_zeros":false,"unit":"$"}},"format":{"delimiter":",","precision":3,"separator":".","significant":false,"strip_insignificant_zeros":false},"human":{"decimal_units":{"format":"%n %u","units":{"billion":"Billion","million":"Million","quadrillion":"Quadrillion","thousand":"Thousand","trillion":"Trillion","unit":""}},"format":{"delimiter":"","precision":3,"significant":true,"strip_insignificant_zeros":true},"storage_units":{"format":"%n %u","units":{"byte":{"one":"Byte","other":"Bytes"},"eb":"EB","gb":"GB","kb":"KB","mb":"MB","pb":"PB","tb":"TB"}}},"percentage":{"format":{"delimiter":"","format":"%n%"}},"precision":{"format":{"delimiter":""}}},"option":{"root":"\u003c\u003c Root \u003e\u003e"},"saving":{"saving":"Setup saving","setup":"Setup spending","year_saving":"Setting saving of year"},"sessions":{"forgot_password":"Forgot password","login":"Log in","logout":"Logout","new_account":"New account?","remember_me":"remember me"},"support":{"array":{"last_word_connector":", and ","two_words_connector":" and ","words_connector":", "}},"table":{"head":{"address":"Address","cat_name":"Category Name","email":"Email","id":"ID","name":"Name","phone":"Phone","role":"Role","savings":"Savings Rate","username":"Username"},"title":{"categories":"Categories","edit_user":"Edit User Information","savings":"Savings Rate Table","users":"User Table"}},"time":{"am":"am","formats":{"default":"%a, %d %b %Y %H:%M:%S %z","long":"%B %d, %Y %H:%M","short":"%d %b %H:%M"},"pm":"pm"},"title":{"base":"Money Lover","create":"Create %{obj}","create_savings":"Create Savings","edit":"Edit %{obj}","forgot_password":"Forgot password","info":"%{obj} Information"},"users":{"change":"Change","create_my_account":"Create my account","edit":"Edit","profile":"Profile","setting":"Setting","update":"Update"},"views":{"pagination":{"first":"\u0026laquo; First","last":"Last \u0026raquo;","next":"Next \u0026rsaquo;","previous":"\u0026lsaquo; Prev","truncate":"\u0026hellip;"}},"year_report":{"month":{"month":"Month","t1":"January","t10":"October","t11":"November","t12":"December","t2":"February","t3":"March","t4":"April","t5":"May","t6":"June","t7":"July","t8":"August","t9":"September"},"other":{"month":" months"},"table":{"name_column":{"amount":"Amount","expense":"Expense","income":"Income","intense":"Intense","month":"Month","saved":"Savings","stt_col":"#"}},"title":{"column_title":"Income and Expense in ","expense_title":"Expense","incomes_title":"Income","intent_title":"Intent's Saving","intents":"Intent Saving In Year","old_month":"Previous month report","titles_year":"Year Report"}}});
I18n.translations["vi"] = I18n.extend((I18n.translations["vi"] || {}), {"activerecord":{"errors":{"messages":{"record_invalid":"Validation failed: %{errors}","restrict_dependent_destroy":{"has_many":"Cannot delete record because dependent %{record} exist","has_one":"Cannot delete record because a dependent %{record} exists"}}}},"admin":{"alert":{"no_data":"No data to statistic","no_result":"No data in %{obj} to statistic"},"label":{"enter_year":"Enter year: "},"months":{"_1":"Jan","_10":"Oct","_11":"Nov","_12":"Dec","_2":"Feb","_3":"Mar","_4":"Apr","_5":"May","_6":"Jun","_7":"Jul","_8":"Aug","_9":"Sep"},"stats_by_year":{"_x":"Month","_y":"Users"},"title":{"month_stats":"Statistic User Register by Month","year_stats":"Statistic User Register by Year","year_stats_2":"Statistic Users Register by months in "}},"alert":{"confirm_del":"Are you sure?","created":"%{obj} Created","delete_failed":"%{obj} Delete Failed","deleted":"%{obj} Deleted","error":"error","fail":" Failed","form_contain":"The form contains","not_found":"%{obj} Not Found","updated":"%{obj} Updated","welcome_admin":"Welcome to admin dashboards"},"button":{"back":"Back","back_to_home":"Back to home","close":"Close","delete":"Delete","new":"Add new","save":"Save","save_month_intense":"Save","send_mail":"Send to mail","signup":"Sign up","submit":"Show statistic","update":"Update","update_password":"Update password","view":"View"},"date":{"abbr_day_names":["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],"abbr_month_names":[null,"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"day_names":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],"formats":{"default":"%Y-%m-%d","long":"%B %d, %Y","short":"%b %d"},"month_names":[null,"January","February","March","April","May","June","July","August","September","October","November","December"],"order":["year","month","day"]},"datetime":{"distance_in_words":{"about_x_hours":{"one":"about 1 hour","other":"about %{count} hours"},"about_x_months":{"one":"about 1 month","other":"about %{count} months"},"about_x_years":{"one":"about 1 year","other":"about %{count} years"},"almost_x_years":{"one":"almost 1 year","other":"almost %{count} years"},"half_a_minute":"half a minute","less_than_x_minutes":{"one":"less than a minute","other":"less than %{count} minutes"},"less_than_x_seconds":{"one":"less than 1 second","other":"less than %{count} seconds"},"over_x_years":{"one":"over 1 year","other":"over %{count} years"},"x_days":{"one":"1 day","other":"%{count} days"},"x_minutes":{"one":"1 minute","other":"%{count} minutes"},"x_months":{"one":"1 month","other":"%{count} months"},"x_seconds":{"one":"1 second","other":"%{count} seconds"},"x_years":{"one":"1 year","other":"%{count} years"}},"prompts":{"day":"Day","hour":"Hour","minute":"Minute","month":"Month","second":"Seconds","year":"Year"}},"error":{"content":"The form contains","error":"Error","not_empty":"Not empty"},"errors":{"connection_refused":"Oops! Failed to connect to the Web Console middleware.\nPlease make sure a rails development server is running.\n","format":"%{attribute} %{message}","messages":{"accepted":"must be accepted","blank":"can't be blank","carrierwave_download_error":"could not be downloaded","carrierwave_integrity_error":"is not of an allowed file type","carrierwave_processing_error":"failed to be processed","confirmation":"doesn't match %{attribute}","content_type_blacklist_error":"You are not allowed to upload %{content_type} files","content_type_whitelist_error":"You are not allowed to upload %{content_type} files","empty":"can't be empty","equal_to":"must be equal to %{count}","even":"must be even","exclusion":"is reserved","extension_blacklist_error":"You are not allowed to upload %{extension} files, prohibited types: %{prohibited_types}","extension_whitelist_error":"You are not allowed to upload %{extension} files, allowed types: %{allowed_types}","greater_than":"must be greater than %{count}","greater_than_or_equal_to":"must be greater than or equal to %{count}","inclusion":"is not included in the list","invalid":"is invalid","less_than":"must be less than %{count}","less_than_or_equal_to":"must be less than or equal to %{count}","max_size_error":"File size should be less than %{max_size}","min_size_error":"File size should be greater than %{min_size}","mini_magick_processing_error":"Failed to manipulate with MiniMagick, maybe it is not an image? Original Error: %{e}","model_invalid":"Validation failed: %{errors}","not_a_number":"is not a number","not_an_integer":"must be an integer","odd":"must be odd","other_than":"must be other than %{count}","present":"must be blank","required":"must exist","rmagick_processing_error":"Failed to manipulate with rmagick, maybe it is not an image?","taken":"has already been taken","too_long":{"one":"is too long (maximum is 1 character)","other":"is too long (maximum is %{count} characters)"},"too_short":{"one":"is too short (minimum is 1 character)","other":"is too short (minimum is %{count} characters)"},"wrong_length":{"one":"is the wrong length (should be 1 character)","other":"is the wrong length (should be %{count} characters)"}},"template":{"body":"There were problems with the following fields:","header":{"one":"1 error prohibited this %{model} from being saved","other":"%{count} errors prohibited this %{model} from being saved"}},"unacceptable_request":"A supported version is expected in the Accept header.\n","unavailable_session":"Session %{id} is no longer available in memory.\n\nIf you happen to run on a multi-process server (like Unicorn or Puma) the process\nthis request hit doesn't store %{id} in memory. Consider turning the number of\nprocesses/workers to one (1) or using a different server in development.\n"},"flash":{"created_account":"Created account","email_invalid":"Email not found","invalid_account":"Invalid email or password","no_account":"No account","pass_exp":"Expried","sent_password_reset":"Please check your mail to reset password","success":"Successful","update_fail":"Please rewrite","update_success":"Update Successful"},"header":{"logo":{"_1":"Money","_2":"Lover"},"toggle":"Toggle navigation"},"helpers":{"page_entries_info":{"entry":{"one":"entry","other":"entries","zero":"entries"},"more_pages":{"display_entries":"Displaying %{entry_name} \u003cb\u003e%{first}\u0026nbsp;-\u0026nbsp;%{last}\u003c/b\u003e of \u003cb\u003e%{total}\u003c/b\u003e in total"},"one_page":{"display_entries":{"one":"Displaying \u003cb\u003e1\u003c/b\u003e %{entry_name}","other":"Displaying \u003cb\u003eall %{count}\u003c/b\u003e %{entry_name}","zero":"No %{entry_name} found"}}},"select":{"prompt":"Please select"},"submit":{"create":"Create %{model}","submit":"Save %{model}","update":"Update %{model}"}},"home":"Home","i18n":{"plural":{"keys":["one","other"],"rule":{}}},"mail":{"content_expire":"This link will expire in two hours.","foot":"If you did not request your password to be reset, please ignore this email and your password will stay as it is.","head":"To reset your password click the link below:","password_reset":"password reset"},"menu":{"account":"Account","logout":"Logout","manage_db":"Manage Database","profile":"Profile","stat_user_by_month":"Statistic Users By Month","stat_user_by_year":"Statistic Users By Year","stat_users":"Statistic Users","statistic":"Statistic"},"month_intense":"Setup intent of month","month_report":{"account":"Account","link_page":{"account":"Account","category":"Category","logOut":"Log Out","month_report":"Month Report","move_chart":"*Move to Chart","move_report":"*Move to Report","profile":"Profile","year_report":"Year Report"},"name_chart":{"expense":"Expense","income":"Income"},"name_column":{"amout_col":"Amout","category_col":"Category","income_col":"Income/Expense","name_col":"Name","saving":"Savings","stt_col":"#","sum_expense_col":"Expense's Sum","sum_income_col":"Income's Sum"},"other":{"footer":"RubyTeam 2019 ","toggle":"Toggle navigation"},"title":{"add_transaction":"Add Transaction","amout":"Amout","base":"Money Lover","category":"Category","columnChart":"Income/Expense Column's Chart","lover":"Lover","money":"Money","month_report":"Month's Report","note":"Name","pieChart":"Income/Expense Pie's Chart","time":"Date","transaction":"Transaction"}},"number":{"currency":{"format":{"delimiter":",","format":"%u%n","precision":2,"separator":".","significant":false,"strip_insignificant_zeros":false,"unit":"$"}},"format":{"delimiter":",","precision":3,"separator":".","significant":false,"strip_insignificant_zeros":false},"human":{"decimal_units":{"format":"%n %u","units":{"billion":"Billion","million":"Million","quadrillion":"Quadrillion","thousand":"Thousand","trillion":"Trillion","unit":""}},"format":{"delimiter":"","precision":3,"significant":true,"strip_insignificant_zeros":true},"storage_units":{"format":"%n %u","units":{"byte":{"one":"Byte","other":"Bytes"},"eb":"EB","gb":"GB","kb":"KB","mb":"MB","pb":"PB","tb":"TB"}}},"percentage":{"format":{"delimiter":"","format":"%n%"}},"precision":{"format":{"delimiter":""}}},"option":{"root":"\u003c\u003c Root \u003e\u003e"},"saving":{"saving":"Setup saving","setup":"Setup spending","year_saving":"Setting saving of year"},"sessions":{"forgot_password":"Forgot password","login":"Log in","logout":"Logout","new_account":"New account?","remember_me":"remember me"},"support":{"array":{"last_word_connector":", and ","two_words_connector":" and ","words_connector":", "}},"table":{"head":{"address":"Address","cat_name":"Category Name","email":"Email","id":"ID","name":"Name","phone":"Phone","role":"Role","savings":"Savings Rate","username":"Username"},"title":{"categories":"Categories","edit_user":"Edit User Information","savings":"Savings Rate Table","users":"User Table"}},"time":{"am":"am","formats":{"default":"%a, %d %b %Y %H:%M:%S %z","long":"%B %d, %Y %H:%M","short":"%d %b %H:%M"},"pm":"pm"},"title":{"base":"Money Lover","create":"Create %{obj}","create_savings":"Create Savings","edit":"Edit %{obj}","forgot_password":"Forgot password","info":"%{obj} Information"},"users":{"change":"Change","create_my_account":"Create my account","edit":"Edit","profile":"Profile","setting":"Setting","update":"Update"},"views":{"pagination":{"first":"\u0026laquo; First","last":"Last \u0026raquo;","next":"Next \u0026rsaquo;","previous":"\u0026lsaquo; Prev","truncate":"\u0026hellip;"}},"year_report":{"month":{"month":"Month","t1":"January","t10":"October","t11":"November","t12":"December","t2":"February","t3":"March","t4":"April","t5":"May","t6":"June","t7":"July","t8":"August","t9":"September"},"other":{"month":" months"},"table":{"name_column":{"amount":"Amount","expense":"Expense","income":"Income","intense":"Intense","month":"Month","saved":"Savings","stt_col":"#"}},"title":{"column_title":"Income and Expense in ","expense_title":"Expense","incomes_title":"Income","intent_title":"Intent's Saving","intents":"Intent Saving In Year","old_month":"Previous month report","titles_year":"Year Report"}}});
