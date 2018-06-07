import { autocomplete } from 'jquery-ui/ui/widgets/autocomplete';

function autocompleteSchools () {
   $('#profile_school_child_name').autocomplete({
      source: $('#profile_school_child_name').data('autocomplete-source')
    });



}


export { autocompleteSchools };
