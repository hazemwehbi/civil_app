<template>
<div>
        <v-navigation-drawer
        v-model="drawer"
        absolute
        temporary
      >
        <v-list class="pa-1">
          <v-list-tile avatar>
             <v-list-tile-content>
              <v-list-tile-title>{{getCurrentUser().name}}</v-list-tile-title>
            </v-list-tile-content>
            <v-list-tile-avatar class="min-width-20 mt-7 ">
             <img src="img/logo.png"  alt="logo" width="150" style="border-radius:20px;" />
            </v-list-tile-avatar>
  
          </v-list-tile>
        </v-list>
  
        <v-list class="pt-0" dense>
          <v-divider></v-divider>
  
          <v-list-tile
          >
            <v-list-tile-action>
              <v-icon>kfld</v-icon>
            </v-list-tile-action>
  
            <v-list-tile-content>
              <v-list-tile-title>
              <notification></notification>
              {{trans('data.notifications')}}
              </v-list-tile-title>
              <v-list-tile-title>
                <router-link to="/" style="color:white;">
                    {{trans('data.home')}}
                </router-link> 
              </v-list-tile-title>
               <v-list-tile-title>
                <router-link to="/" style="color:white;">
                    {{trans('data.to_do_list')}}
                </router-link> 
              </v-list-tile-title>
              <v-list-tile-content>
                <v-menu 
                attach
                   offset-y
                   bottom
                   center
                   nudge-bottom="14"
                   transition="slide-x-transition"
                   >
                    <v-btn flat slot="activator">
                       <b style="font-size:14px;">
                           <v-icon>language</v-icon>
                           {{trans('data.language')}}
                           </b>
                   </v-btn> 
                  
               
                   <v-list>
                       <v-list-tile style="background: darkgrey;"  @click="save()"> 
                           <v-list-tile-title>
                           <span :class="'flag-icon flag-icon-'+language=='ar'?'sa':'us'"></span> {{ language }}
                           </v-list-tile-title>
                       </v-list-tile>
                       <v-list-tile v-for="(lang,key) in getLanguages()" :key="key" class="min-h-max">
                           <v-list-tile-title>
                                   <div v-if="key!=language" @click='change(lang)' >
                                    <span :class="'pa-0 ma-0 max-h-full w-full flag-icon flag-icon-'+lang['flag-icon']"></span>
                                     {{lang['display']}}
                                    </div>
                           </v-list-tile-title>
                       </v-list-tile>
                   </v-list>
                  


                </v-menu>
              </v-list-tile-content>
            </v-list-tile-content>
          </v-list-tile>
        </v-list>
      </v-navigation-drawer>
      </div>
</template>

<script>
export default {
  props:{
drawer: null
  },
data(){
return {
language: null,
}
},
created(){
     self.language = localStorage.getItem('currentLange')?localStorage.getItem('currentLange'):self.getLanguages().ar
},
methods:{
    change(lang){
        ///lang/ar
        localStorage.setItem("currenpathaftercjange",localStorage.getItem("currenpath"));
        localStorage.setItem("currentLange",lang);
        localStorage.removeItem("currenpath");
       // window.location.href = "lang/"+lang; //causes the browser to refresh and load the requested url
        language= lang;
        console.log(lang)
        }
}
}
</script>

<style>

</style>