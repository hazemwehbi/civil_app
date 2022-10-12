<template>
   <v-layout row justify-center>
    <v-dialog
      v-model="dialog"
      max-width="300"
    >
      <v-card>
        <v-card-title class="headline">{{ trans('data.customer_info') }}</v-card-title>

        <v-card-text>
      <v-layout row wrap>
                                  
                                    <v-flex xs12 md4>
                                        <v-text-field
                                            v-model="id_card_number"
                                            type="number"
                                            :label="trans('data.id_card_number')"
                                            @input="findCustomer"
                                        ></v-text-field>
                                    </v-flex>
                                    <v-flex xs12 md4>
                                        <v-text-field
                                            v-model="name"
                                            :label="trans('data.name')"
                                            readonly
                                            
                                        ></v-text-field>
                                    </v-flex>
                                    <v-flex xs12 md4>
                                        <v-text-field
                                            :label="trans('messages.email')"
                                            v-model="email"
                                            readonly
                                            
                                        ></v-text-field>
                                    </v-flex>
      </v-layout>
        </v-card-text>

        <v-card-actions>
          <v-spacer></v-spacer>

          <v-btn
            color="green darken-1"
            flat="flat"
            @click="save"
          >
            {{trans('data.save')}}
          </v-btn>

          <v-btn
            color="green darken-1"
            flat="flat"
            @click="dialog = false"
          >
             {{trans('data.close')}}
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </v-layout>
</template>

<script>
 export default {
    data () {
      return {
        dialog: false,
        id_card_number:null,
        name:null,
        email:null,
        customer:null,
        customers:[]
      }
    },
    created(){
this.getCustomers()
    },
    methods:{
      create(){
this.dialog = true
      },
      findCustomer(event){
        this.customer=this.customers.find(val => val.id_card_number == event)
        console.log(this.customer,this.customers,event)
        if(this.customer){
          this.name = this.customer.name
          this.email = this.customer.email
        }
      },
        getCustomers() {
            const self = this;
                axios
                    .get('/customers')
                    .then(function (response) {
                        self.customers = response.data;
                        
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
        },
        save(){
          const self =this
          self.dialog = false
          axios.post('/enginner_office/addNewEmployee',{id:self.customer.id})
          .then(function (response) {
                        self.$store.commit('showSnackbar', {
                            message: response.data.msg,
                            color: response.data.success,
                        });
                        self.$store.commit('hideLoader');
                        if (response.data.success === true) {
                          //  self.goBack();
                        }
                    })
                    .catch(function (error) {
                        self.$store.commit('hideLoader');
                      //  alert(JSON.stringify(error.response.data.message))
                        self.$store.commit('showSnackbar', {
                            message: error.response,
                            color: 'error',
                            duration: 50000,
                        });
        })
        },
    }
 }
</script>

<style>

</style>