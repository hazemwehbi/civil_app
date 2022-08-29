<template>
 <div class="z-10 inset-0 mx-auto w-3/4">
    <div class="flex items-stretch md:items-center justify-center min-h-full text-center md:px-2 lg:px-4">
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
              <img  v-if="data.avatar_url"
                                    :src="data.avatar_url"  class="object-center object-cover mx-auto rounded-full w-40 h-40 mt-4">
            <div v-else class="mx-auto rounded-full w-40 h-40 mt-3 bg-gray-300 text-center text-7xl pt-10">
           {{data.name[0]}}
           </div>
            <h2 class="text-2xl font-bold text-gray-900 text-center mt-3">{{ data.name }}</h2>
            <h3 id="information-heading" class="font-bold text-gray-900 text-center">{{ trans('messages.guardian_name') }}</h3>
                <table class="border-collapse table-auto w-full text-sm">
  <tbody class="dark:bg-slate-800">
    <tr>
      <td class="whitespace-nowrap border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ trans('data.id_card_number') }}:</td>
      <td class="whitespace-nowrap border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ data.id_card_number}}</td>
    </tr>
    <tr>
      <td class="whitespace-nowrap border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ trans('messages.email') }}:</td>
      <td class="whitespace-nowrap border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ data.email }}</td>
      </tr>
  </tbody>
                </table>
                 <!-- <fieldset class="mt-8 mb-4 absolute bottom-4 w-80">
                      <legend class="sr-only">Choose a color</legend>
                      <span class="flex items-center space-x-3">
                       
                        <span :to="$router.push(data.facebook)" class="m-0.5 shadow-none relative p-0.5 rounded-full flex items-center justify-center cursor-pointer focus:outline-none ring-gray-400">
                        <svg
  class="w-6 h-6 text-blue-600 fill-current"
  xmlns="http://www.w3.org/2000/svg"
  viewBox="0 0 24 24">
  <path
    d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"
  />
</svg>
                        </span>

                       
                        <span :to="$router.push(data.twitter)" class="-m-0.5 relative p-0.5 rounded-full flex items-center justify-center cursor-pointer focus:outline-none ring-gray-400">
                         <svg
  class="w-6 h-6 text-blue-300 fill-current"
  xmlns="http://www.w3.org/2000/svg"
  viewBox="0 0 24 24">
  <path
    d="M23.953 4.57a10 10 0 01-2.825.775 4.958 4.958 0 002.163-2.723c-.951.555-2.005.959-3.127 1.184a4.92 4.92 0 00-8.384 4.482C7.69 8.095 4.067 6.13 1.64 3.162a4.822 4.822 0 00-.666 2.475c0 1.71.87 3.213 2.188 4.096a4.904 4.904 0 01-2.228-.616v.06a4.923 4.923 0 003.946 4.827 4.996 4.996 0 01-2.212.085 4.936 4.936 0 004.604 3.417 9.867 9.867 0 01-6.102 2.105c-.39 0-.779-.023-1.17-.067a13.995 13.995 0 007.557 2.209c9.053 0 13.998-7.496 13.998-13.985 0-.21 0-.42-.015-.63A9.935 9.935 0 0024 4.59z"
  />
</svg>
                        </span>

                       
                        <span :to="$router.push(data.whatsapp)" class="-m-0.5 relative p-0.5 rounded-full flex items-center justify-center cursor-pointer focus:outline-none ring-gray-900">
                       <svg
  class="w-6 h-6 text-green-400 fill-current"
  xmlns="http://www.w3.org/2000/svg"
  viewBox="0 0 448 512">
  <path
    d="M380.9 97.1C339 55.1 283.2 32 223.9 32c-122.4 0-222 99.6-222 222 0 39.1 10.2 77.3 29.6 111L0 480l117.7-30.9c32.4 17.7 68.9 27 106.1 27h.1c122.3 0 224.1-99.6 224.1-222 0-59.3-25.2-115-67.1-157zm-157 341.6c-33.2 0-65.7-8.9-94-25.7l-6.7-4-69.8 18.3L72 359.2l-4.4-7c-18.5-29.4-28.2-63.3-28.2-98.2 0-101.7 82.8-184.5 184.6-184.5 49.3 0 95.6 19.2 130.4 54.1 34.8 34.9 56.2 81.2 56.1 130.5 0 101.8-84.9 184.6-186.6 184.6zm101.2-138.2c-5.5-2.8-32.8-16.2-37.9-18-5.1-1.9-8.8-2.8-12.5 2.8-3.7 5.6-14.3 18-17.6 21.8-3.2 3.7-6.5 4.2-12 1.4-32.6-16.3-54-29.1-75.5-66-5.7-9.8 5.7-9.1 16.3-30.3 1.8-3.7.9-6.9-.5-9.7-1.4-2.8-12.5-30.1-17.1-41.2-4.5-10.8-9.1-9.3-12.5-9.5-3.2-.2-6.9-.2-10.6-.2-3.7 0-9.7 1.4-14.8 6.9-5.1 5.6-19.4 19-19.4 46.3 0 27.3 19.9 53.7 22.6 57.4 2.8 3.7 39.1 59.7 94.8 83.8 35.2 15.2 49 16.5 66.6 13.9 10.7-1.6 32.8-13.4 37.4-26.4 4.6-13 4.6-24.1 3.2-26.4-1.3-2.5-5-3.9-10.5-6.6z"
  ></path>
</svg>
                        </span>
                                <span :to="$router.push(data.linkedin)" class="-m-0.5 relative p-0.5 rounded-full flex items-center justify-center cursor-pointer focus:outline-none ring-gray-900">
 <svg
  class="w-6 h-6 text-blue-500 fill-current"
  xmlns="http://www.w3.org/2000/svg"
  viewBox="0 0 448 512">
  <path
    d="M100.28 448H7.4V148.9h92.88zM53.79 108.1C24.09 108.1 0 83.5 0 53.8a53.79 53.79 0 0 1 107.58 0c0 29.7-24.1 54.3-53.79 54.3zM447.9 448h-92.68V302.4c0-34.7-.7-79.2-48.29-79.2-48.29 0-55.69 37.7-55.69 76.7V448h-92.78V148.9h89.08v40.8h1.3c12.4-23.5 42.69-48.3 87.88-48.3 94 0 111.28 61.9 111.28 142.3V448z"
  ></path>
</svg>
                        </span>
                                    <span :to="$router.push(data.telegram)" class="-m-0.5 relative p-0.5 rounded-full flex items-center justify-center cursor-pointer focus:outline-none ring-gray-900">
<svg
  class="w-6 h-6 text-gray-400 text-blue-400 fill-current"
  xmlns="http://www.w3.org/2000/svg"
  viewBox="0 0 496 512">
  <path
    d="M248,8C111.033,8,0,119.033,0,256S111.033,504,248,504,496,392.967,496,256,384.967,8,248,8ZM362.952,176.66c-3.732,39.215-19.881,134.378-28.1,178.3-3.476,18.584-10.322,24.816-16.948,25.425-14.4,1.326-25.338-9.517-39.287-18.661-21.827-14.308-34.158-23.215-55.346-37.177-24.485-16.135-8.612-25,5.342-39.5,3.652-3.793,67.107-61.51,68.335-66.746.153-.655.3-3.1-1.154-4.384s-3.59-.849-5.135-.5q-3.283.746-104.608,69.142-14.845,10.194-26.894,9.934c-8.855-.191-25.888-5.006-38.551-9.123-15.531-5.048-27.875-7.717-26.8-16.291q.84-6.7,18.45-13.7,108.446-47.248,144.628-62.3c68.872-28.647,83.183-33.623,92.511-33.789,2.052-.034,6.639.474,9.61,2.885a10.452,10.452,0,0,1,3.53,6.716A43.765,43.765,0,0,1,362.952,176.66Z"
  ></path>
</svg>
                        </span>
                      </span>
                    </fieldset>-->
                      <!--<fieldset class="mt-8">
                      <legend class="sr-only">Choose a color</legend>
                      <span class="flex items-center space-x-3">
                        <span :to="$router.push(data.mobile)" class="m-0.5 shadow-none relative p-0.5 rounded-full flex items-center justify-center cursor-pointer focus:outline-none ring-gray-400">
    <svg   className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M12 18h.01M8 21h8a2 2 0 002-2V5a2 2 0 00-2-2H8a2 2 0 00-2 2v14a2 2 0 002 2z" /></svg>
                        </span>
                    
                       <!-- <span :to="$router.push(data.email)" class="m-0.5 shadow-none relative p-0.5 rounded-full flex items-center justify-center cursor-pointer focus:outline-none ring-gray-400">
    <svg className="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path d="M2.003 5.884L10 9.882l7.997-3.998A2 2 0 0016 4H4a2 2 0 00-1.997 1.884z" /><path d="M18 8.118l-8 4-8-4V14a2 2 0 002 2h12a2 2 0 002-2V8.118z" /></svg>
                        </span>
                        </span>
                       
                    </fieldset>-->
            </div>
            <div class="sm:col-span-8 lg:col-span-7">
              <section aria-labelledby="information-heading" class="mt-2 mx-auto">
                  <v-tabs
      color="accent-4"
    >
      <v-tab><h3 id="information-heading">{{trans('messages.personal_data')}}</h3></v-tab>
      <v-tab>{{trans('data.document_info')}}</v-tab>

      <v-tab-item
      >
        <v-container fluid>
          <table class="border-collapse table-auto w-full text-sm text-center">
  <tbody class="bg-white dark:bg-slate-800">
    <tr>
      <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ trans('messages.date_of_birth') }}:</td>
      <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ data.birth_date | formatDate }}fldgfldg</td>
    </tr>
    <tr>
      <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ trans('messages.gender') }}:</td>
      <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ trans('messages.' + data.gender) }}</td>
      </tr>
      <tr>
      <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ trans('messages.mobile') }}:</td>
      <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ data.mobile }}</td>
    </tr>
     <tr>
      <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ trans('messages.home_address') }}:</td>
      <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ data.home_address }}</td>
    </tr>
      <tr>
      <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ trans('data.speciality') }}:</td>
      <td class="border-b border-slate-100 dark:border-slate-700 p-4 pl-8 text-slate-500 dark:text-slate-400">{{ data.specialty != null ?  data.specialty.name : ''  }}</td>
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
     
<div class="container mx-auto space-y-2 lg:space-y-0 lg:gap-2 lg:grid lg:grid-cols-2">
    <div class="w-full rounded hover:shadow-2xl">
        <img :src="data.signature"
            alt="image">
    </div>
    <div class="w-full rounded hover:opacity-50">
        <img :src="data.logo"
            alt="image">
    </div>
</div>
</v-tab-item>
    </v-tabs>
                

                                   
              </section>
              <!-- <section v-if="data.signature" aria-labelledby="options-heading" class=" mx-auto flex mt-4">
        <span>{{ trans('data.signature') }}:</span>        
<img  :src="data.signature" height="150" class="max-h-40" />

</section>-->
              <section aria-labelledby="options-heading" class="mt-2 mx-auto">
              
                  <div class="flex">
                  <button  v-if="true"
                   @click="$router.push({ name: 'profile.edit', params: { id: data.id } })"
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
export default {
    data() {
        return {
            data: [],
            profileImg: [],
        //    enginnering_type: '',
        };
    },
    created() {
        const self = this;
        self.getUserProfile();
    },
    methods: {
        getUserProfile() {
            const self = this;
            axios
                .get('/manage-profiles')
                .then(function (response) {
                    self.data = response.data;
                })
                .catch(function (error) {
                    console.log(error);
                });
        },
    },
};
</script>