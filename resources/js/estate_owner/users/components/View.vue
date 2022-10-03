<template>
   <!-- <div  :class="$vuetify.breakpoint.xsOnly?'pt-2':''">
        <v-toolbar color="cyan" dark tabs height="28">
            <v-toolbar-title>{{ employee.name }}</v-toolbar-title>
            <template slot="extension">
                <v-tabs
                    centered
                    color="cyan"
                    slider-color="yellow"
                    v-model="tabs"
                    dark
                    icons-and-text
                    height="47"
                >
       
                    <v-tab href="#tab-1">
                        {{ trans('messages.overview') }}
                        <v-icon>dvr</v-icon>
                    </v-tab>

                    <v-tab href="#tab-2">
                        {{ trans('messages.documents_notes') }}
                        <v-icon>perm_media</v-icon>
                    </v-tab>
          
                </v-tabs>
            </template>
        </v-toolbar>
    
        <v-tabs-items v-model="tabs">
            <v-tab-item :key="1" :value="'tab-1'">
                <v-card flat>
                    <v-card-text> <EmployeeOverview></EmployeeOverview> </v-card-text>
                </v-card>
            </v-tab-item>
            <v-tab-item :key="2" :value="'tab-2'">
                <v-card flat>
                    <v-card-text> <NoteAndDocumentList></NoteAndDocumentList> </v-card-text>
                </v-card>
            </v-tab-item>
        </v-tabs-items>
 
    </div>-->
     <ProfileMobile v-if="$vuetify.breakpoint.xsOnly" :data="employee"/>
 <div v-else class="z-10 inset-0 mx-auto w-3/4">
    <div  class="flex items-stretch md:items-center justify-center min-h-full text-center md:px-2 lg:px-4">
      <div class="flex text-base text-left transform transition w-full md:max-w-2xl md:px-4 md:my-8 lg:max-w-4xl">
        <div class="w-full relative flex items-center bg-white px-4 pt-14 pb-8 overflow-hidden shadow-2xl sm:px-6 sm:pt-8 md:p-6 lg:p-8">
          <!--<button type="button" class="absolute top-4 right-4 text-gray-400 hover:text-gray-500 sm:top-8 sm:right-6 md:top-6 md:right-6 lg:top-8 lg:right-8">
            <span class="sr-only">Close</span>
         
            <svg class="h-6 w-6" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true">
              <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
            </svg>
          </button>-->

          <div class="w-full grid grid-cols-1 gap-y-8 gap-x-6 items-start sm:grid-cols-12 lg:gap-x-8">
            <div class="rounded-lg h-full overflow-hidden sm:col-span-4 bg-slate-200">
              <img  v-if="employee.avatar_url"
                                    :src="employee.avatar_url"  class="object-center object-cover mx-auto rounded-full w-40 h-40 mt-4">
            <div v-else class="mx-auto rounded-full w-40 h-40 mt-3 bg-gray-300 text-center text-7xl pt-10">
           {{employee.name?employee.name[0]:''}}
           </div>
            <h2 class="text-2xl font-bold text-gray-900 text-center mt-3">{{ employee.name }}</h2>
            <h3 id="information-heading" class="font-bold text-gray-900 text-center">{{ trans('messages.guardian_name') }}</h3>
           
  <div class="dark:bg-slate-800 w-full text-sm flex-col">
    <div class="flex justify-between flex-wrap">
      <div class="whitespace-nowrap border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400 w-1/2">{{ trans('data.id_card_number') }}:</div>
      <div class="whitespace-nowrap border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400 w-1/2">{{ employee.id_card_number}}</div>
    </div>
    <div class="flex justify-between flex-wrap">
      <div class="whitespace-nowrap border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400 w-1/2">{{ trans('messages.email') }}:</div>
      <div class="whitespace-nowrap border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400 w-1/2">{{ employee.email }}</div>
      </div>
  </div>
            </div>
            <div class="sm:col-span-8 lg:col-span-7">
              <section aria-labelledby="information-heading" class="mt-2 mx-auto">
                  <v-tabs
      color="accent-4"
    >
      <v-tab active-class>{{trans('messages.personal_data')}}</v-tab>
      <v-tab>{{trans('data.document_info')}}</v-tab>

      <v-tab-item
      >
        <v-container fluid>
          <table class="border-collapse table-auto w-full text-sm text-center">
  <tbody class="bg-white dark:bg-slate-800">
    <tr>
      <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ trans('messages.date_of_birth') }}:</td>
      <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ employee.birth_date | formatDate }}</td>
    </tr>
    <tr>
      <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ trans('messages.gender') }}:</td>
      <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ trans('messages.' + employee.gender) }}</td>
      </tr>
      <tr>
      <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ trans('messages.mobile') }}:</td>
      <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ employee.mobile }}</td>
    </tr>
     <tr>
      <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ trans('messages.home_address') }}:</td>
      <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ employee.home_address }}</td>
    </tr>
      <tr>
      <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ trans('data.speciality') }}:</td>
      <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ employee.specialty != null ?  employee.specialty.name : ''  }}</td>
    </tr>
      <!--<tr>
      <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ trans('data.signature') }}:</td>
      <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400"> <img  :src="data.signature" height="150" /></td>
    </tr>-->
  </tbody>
</table>
        </v-container>
      </v-tab-item>
      <v-tab-item>
     
<div v-if="employee.signature" class="container mx-auto space-y-2 lg:space-y-0 lg:gap-2 lg:grid lg:grid-cols-2">
    <div class="w-full rounded hover:shadow-2xl">
        <img :src="employee.signature"
            alt="image">
    </div>
    <div v-if="employee.logo" class="w-full rounded hover:opacity-50">
        <img :src="employee.logo"
            alt="image">
    </div>
</div>
</v-tab-item>
    </v-tabs>
                

                                   
              </section>
   
              <section aria-labelledby="options-heading" class="mt-2 mx-auto">
              
                  <div class="flex">
                  <button  v-if="true"
                   @click="$router.push({ name: 'profile.edit', params: { id: employee.id } })"
                   class="mt-6 w-full bg-indigo-600 border border-transparent rounded-md py-2 px-8 mx-2 flex items-center justify-center text-base font-medium text-white hover:bg-indigo-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                   >
                     {{ trans('messages.edit') }}</button>
                      <button  
                   @click="$router.go(-1)"
                   class="mt-6 w-full bg-gray-600 border border-transparent rounded-md py-2 px-8 mx-2 flex items-center justify-center text-base font-medium text-white hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500"
                   >{{ trans('messages.back') }}
                    </button>
                    </div>
              </section>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import ProfileMobile from '../../../common/profile/components/ProfileMobile.vue'
import MobileHeader from '../../../common/MobileHeader'
import EmployeeOverview from '../components/Overview';
import NoteAndDocumentList from '../notes/List';
export default {
    components: {
        EmployeeOverview,
        NoteAndDocumentList,
              ProfileMobile,
MobileHeader
    },
    data() {
        return {
            user_id: null,
            employee: [],
            tabs: 'tab-1',
        };
    },
    created() {
        const self = this;
        self.user_id = self.$route.params.id;
        self.getEmployee(self.user_id);
    },
    methods: {
        getEmployee(user_id) {
            const self = this;
            axios
                .get('/admin/users/' + user_id + '/name')
                .then(function(response) {
                    self.employee = response.data;
                })
                .catch(function(error) {
                    console.log(error);
                });
        },
    },
};
</script>
