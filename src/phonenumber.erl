-module(phonenumber).

-include("libphonenumber.hrl").

-export([
    new/0,

    has_country_code/1,
    get_country_code/1,
    set_country_code/2,
    clear_country_code/1,

    has_national_number/1,
    get_national_number/1,
    set_national_number/2,
    clear_national_number/1,

    has_extension/1,
    get_extension/1,
    set_extension/2,
    clear_extension/1,

    has_italian_leading_zero/1,
    set_italian_leading_zero/2,
    is_italian_leading_zero/1,
    clear_italian_leading_zero/1,

    has_number_of_leading_zeros/1,
    get_number_of_leading_zeros/1,
    set_number_of_leading_zeros/2,
    clear_number_of_leading_zeros/1,

    has_raw_input/1,
    get_raw_input/1,
    set_raw_input/2,
    clear_raw_input/1,

    has_country_code_source/1,
    get_country_code_source/1,
    set_country_code_source/2,
    clear_country_code_source/1,

    has_preferred_domestic_carrier_code/1,
    get_preferred_domestic_carrier_code/1,
    set_preferred_domestic_carrier_code/2,
    clear_preferred_domestic_carrier_code/1,

    clear/1,
    merge_from/2,
    exactly_same_as/2
]).

-spec new() ->
    PhoneNumber::phonenumber().

new() ->
    #phonenumber{
        has_country_code = false,
        country_code = 0,
        has_national_number = false,
        national_number = 0,
        has_extension = false,
        extension = <<>>,
        has_number_of_leading_zeros = false,
        number_of_leading_zeros = 1,
        has_italian_leading_zero = false,
        italian_leading_zero = false,
        has_raw_input = false,
        raw_input = <<>>,
        has_country_code_source = false,
        country_code_source = from_number_with_plus_sign,
        has_preferred_domestic_carrier_code = false,
        preferred_domestic_carrier_code = <<>>
    }.

%% country_code

-spec has_country_code(PhoneNumber::phonenumber()) ->
    boolean().

has_country_code(#phonenumber{has_country_code=Value}) ->
    Value.

-spec get_country_code(PhoneNumber::phonenumber()) ->
    non_neg_integer().

get_country_code(#phonenumber{country_code=Value}) ->
    Value.

-spec set_country_code(CountryCode::non_neg_integer(), PhoneNumber::phonenumber()) ->
    NewPhoneNumber::phonenumber().

set_country_code(CountryCode, PhoneNumber) when is_integer(CountryCode)  ->
    PhoneNumber#phonenumber{has_country_code = true, country_code = CountryCode}.

-spec clear_country_code(PhoneNumber::phonenumber()) ->
    NewPhoneNumber::phonenumber().

clear_country_code(PhoneNumber) ->
    PhoneNumber#phonenumber{has_country_code=false, country_code = 0}.

%% national_number

-spec has_national_number(PhoneNumber::phonenumber()) ->
    boolean().

has_national_number(#phonenumber{has_national_number=Value}) ->
    Value.

-spec get_national_number(PhoneNumber::phonenumber()) ->
    non_neg_integer().

get_national_number(#phonenumber{national_number=Value}) ->
    Value.

-spec set_national_number(NationalNumber::non_neg_integer(), PhoneNumber::phonenumber()) ->
    NewPhoneNumber::phonenumber().

set_national_number(NationalNumber, PhoneNumber) when is_integer(NationalNumber) ->
    PhoneNumber#phonenumber{has_national_number=true, national_number = NationalNumber}.

-spec clear_national_number(PhoneNumber::phonenumber()) ->
    NewPhoneNumber::phonenumber().

clear_national_number(PhoneNumber) ->
    PhoneNumber#phonenumber{has_national_number=false, national_number = 0}.

%% extension

-spec has_extension(PhoneNumber::phonenumber()) ->
    boolean().

has_extension(#phonenumber{has_extension=Value}) ->
    Value.

-spec get_extension(PhoneNumber::phonenumber()) ->
    binary().

get_extension(#phonenumber{extension = Ext}) ->
    Ext.

-spec set_extension(Extension::binary(), PhoneNumber::phonenumber()) ->
    NewPhoneNumber::phonenumber().

set_extension(Extension, PhoneNumber) ->
    PhoneNumber#phonenumber{has_extension = true, extension = Extension}.

-spec clear_extension(PhoneNumber::phonenumber()) ->
    NewPhoneNumber::phonenumber().

clear_extension(PhoneNumber) ->
    PhoneNumber#phonenumber{has_extension=false, extension = <<>>}.

%% italian leading zero

-spec has_italian_leading_zero(PhoneNumber::phonenumber()) ->
    boolean().

has_italian_leading_zero(#phonenumber{has_italian_leading_zero=Value}) ->
    Value.

-spec is_italian_leading_zero(PhoneNumber::phonenumber()) ->
    boolean().

is_italian_leading_zero(#phonenumber{italian_leading_zero=Value}) ->
    Value.

-spec set_italian_leading_zero(ItalianLeadingZero::boolean(), PhoneNumber::phonenumber()) ->
    NewPhoneNumber::phonenumber().

set_italian_leading_zero(ItalianLeadingZero, PhoneNumber) ->
    PhoneNumber#phonenumber{has_italian_leading_zero = true, italian_leading_zero = ItalianLeadingZero}.

-spec clear_italian_leading_zero(PhoneNumber::phonenumber()) ->
    NewPhoneNumber::phonenumber().

clear_italian_leading_zero(PhoneNumber) ->
    PhoneNumber#phonenumber{has_italian_leading_zero = false, italian_leading_zero = false}.

%% number of leading zeros

-spec has_number_of_leading_zeros(PhoneNumber::phonenumber()) ->
    boolean().

has_number_of_leading_zeros(#phonenumber{has_number_of_leading_zeros=Value}) ->
    Value.

-spec get_number_of_leading_zeros(PhoneNumber::phonenumber()) ->
    non_neg_integer().

get_number_of_leading_zeros(#phonenumber{number_of_leading_zeros=Value}) ->
    Value.

-spec set_number_of_leading_zeros(NumberOfLeadingZeros::non_neg_integer(), PhoneNumber::phonenumber()) ->
    NewPhoneNumber::phonenumber().

set_number_of_leading_zeros(NumberOfLeadingZeros, PhoneNumber) ->
    PhoneNumber#phonenumber{has_number_of_leading_zeros = true, number_of_leading_zeros = NumberOfLeadingZeros}.

-spec clear_number_of_leading_zeros(PhoneNumber::phonenumber()) ->
    NewPhoneNumber::phonenumber().

clear_number_of_leading_zeros(PhoneNumber) ->
    PhoneNumber#phonenumber{has_number_of_leading_zeros = false, number_of_leading_zeros = 1}.

%% raw imput

-spec has_raw_input(PhoneNumber::phonenumber()) ->
    boolean().

has_raw_input(#phonenumber{has_raw_input=Value}) ->
    Value.

-spec get_raw_input(PhoneNumber::phonenumber()) ->
    binary().

get_raw_input(#phonenumber{raw_input=Value}) ->
    Value.

-spec set_raw_input(RawInput::binary(), PhoneNumber::phonenumber()) ->
    NewPhoneNumber::phonenumber().

set_raw_input(RawInput, PhoneNumber) ->
    PhoneNumber#phonenumber{has_raw_input=true, raw_input = RawInput}.

-spec clear_raw_input(PhoneNumber::phonenumber()) ->
    NewPhoneNumber::phonenumber().

clear_raw_input(PhoneNumber) ->
    PhoneNumber#phonenumber{has_raw_input=false, raw_input = <<>>}.

%% country code source

-spec has_country_code_source(PhoneNumber::phonenumber()) ->
    boolean().

has_country_code_source(#phonenumber{has_country_code_source=Value}) ->
    Value.

-spec get_country_code_source(PhoneNumber::phonenumber()) ->
    phonenumber_country_code_source().

get_country_code_source(#phonenumber{country_code_source=Value}) ->
    Value.

-spec set_country_code_source(CountryCodeSource::phonenumber_country_code_source(), PhoneNumber::phonenumber()) ->
    NewPhoneNumber::phonenumber().

set_country_code_source(CountryCodeSource, PhoneNumber) ->
    PhoneNumber#phonenumber{has_country_code_source=true, country_code_source = CountryCodeSource}.

-spec clear_country_code_source(PhoneNumber::phonenumber()) ->
    NewPhoneNumber::phonenumber().

clear_country_code_source(PhoneNumber) ->
    PhoneNumber#phonenumber{has_country_code_source=false, country_code_source = from_number_with_plus_sign}.

%% preferred domestic carrier code

-spec has_preferred_domestic_carrier_code(PhoneNumber::phonenumber()) ->
    boolean().

has_preferred_domestic_carrier_code(#phonenumber{has_preferred_domestic_carrier_code=Value}) ->
    Value.

-spec get_preferred_domestic_carrier_code(PhoneNumber::phonenumber()) ->
    binary().

get_preferred_domestic_carrier_code(#phonenumber{preferred_domestic_carrier_code=Value}) ->
    Value.

-spec set_preferred_domestic_carrier_code(PreferredDomesticCarrierCode::binary(), PhoneNumber::phonenumber()) ->
    NewPhoneNumber::phonenumber().

set_preferred_domestic_carrier_code(PreferredDomesticCarrierCode, PhoneNumber) ->
    PhoneNumber#phonenumber{has_preferred_domestic_carrier_code = true, preferred_domestic_carrier_code = PreferredDomesticCarrierCode}.

-spec clear_preferred_domestic_carrier_code(PhoneNumber::phonenumber()) ->
    NewPhoneNumber::phonenumber().

clear_preferred_domestic_carrier_code(PhoneNumber) ->
    PhoneNumber#phonenumber{has_preferred_domestic_carrier_code=false, preferred_domestic_carrier_code = <<>>}.

%% clear

-spec clear(PhoneNumber::phonenumber()) ->
    NewPhoneNumber::phonenumber().

clear(#phonenumber{}) ->
    new().

-spec merge_from(PhoneNumberFrom::phonenumber(), PhoneNumberTo::phonenumber()) ->
    NewPhoneNumber::phonenumber().

merge_from(PhoneNumberFrom, PhoneNumberTo) ->
    Step1 = if PhoneNumberFrom#phonenumber.has_country_code ->
        set_country_code(PhoneNumberFrom#phonenumber.country_code, PhoneNumberTo);
        true -> PhoneNumberTo
    end,
    Step2 = if PhoneNumberFrom#phonenumber.has_national_number ->
        set_national_number(PhoneNumberFrom#phonenumber.national_number, Step1);
        true -> Step1
    end,
    Step3 = if PhoneNumberFrom#phonenumber.has_extension ->
        set_extension(PhoneNumberFrom#phonenumber.extension, Step2);
        true -> Step2
    end,
    Step4 = if PhoneNumberFrom#phonenumber.has_italian_leading_zero ->
        set_italian_leading_zero(PhoneNumberFrom#phonenumber.italian_leading_zero, Step3);
        true -> Step3
    end,
    Step5 = if PhoneNumberFrom#phonenumber.has_number_of_leading_zeros ->
        set_number_of_leading_zeros(PhoneNumberFrom#phonenumber.number_of_leading_zeros, Step4);
        true -> Step4
    end,
    Step6 = if PhoneNumberFrom#phonenumber.has_raw_input ->
        set_raw_input(PhoneNumberFrom#phonenumber.raw_input, Step5);
        true -> Step5
    end,
    Step7 = if PhoneNumberFrom#phonenumber.has_country_code_source ->
        set_country_code_source(PhoneNumberFrom#phonenumber.country_code_source, Step6);
        true -> Step6
    end,
    if PhoneNumberFrom#phonenumber.has_preferred_domestic_carrier_code ->
        set_preferred_domestic_carrier_code(PhoneNumberFrom#phonenumber.preferred_domestic_carrier_code, Step7);
        true -> Step7
    end.

-spec exactly_same_as(PhoneNumber::phonenumber(), PhoneNumberOther::phonenumber()) ->
    boolean().

exactly_same_as(#phonenumber{}=PhoneNumber, #phonenumber{}=PhoneNumberOther) ->
    PhoneNumber == PhoneNumberOther.
