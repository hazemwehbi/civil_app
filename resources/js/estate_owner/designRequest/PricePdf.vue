<template>
    <v-layout row justify-center>
        <v-dialog v-model="dialog" persistent max-width="600px">
            <v-card>
                <v-card-title>
                    <v-icon>assignment</v-icon>
                    <span class="headline">
                        {{ trans('data.viewPrice')}}
                    </span>
                    <v-spacer></v-spacer>
                    <v-btn flat icon @click="dialog = false"> <v-icon>clear</v-icon> </v-btn>
                </v-card-title>
                <v-divider></v-divider>
                <v-card-text>
                
            	<pdf
        ref="myPdfComponent"
        class="mx-auto"
			:src="url"
		>
                <v-progress-circular
      :size="50"
      color="primary"
      indeterminate
    ></v-progress-circular>
        </pdf>
                </v-card-text>
                <v-card-actions>
                    <v-spacer></v-spacer>
                    <v-btn color="green darken-1" flat @click="rejectOffer">
                        {{ trans('data.reject') }}
                    </v-btn>
                    <v-btn
                        color="success"
                        @click="agreeOffer"
                        :loading="loading"
                        :disabled="!valid || !checkActive()"
                    >
                        {{ trans('data.aproved') }}
                    </v-btn>
                </v-card-actions>
            </v-card>
        </v-dialog>
    </v-layout>
</template>

<script>
import pdf from 'vue-pdf'
export default {
       components:{
            pdf
    },
    data() {
        return {
            valid: true,
            dialog: false,
            loading: false,
            url: null,
            item: null
        };
    },
    mounted() {
        const self = this;
    },
    created() {
        const self = this;

    },
    beforeDestroy() {
        const self = this;
    },

    methods: {
        openDialog(item){
          this.dialog =true
          this.item = item
          this.url = item.design_enginners[0].media[0].full_url.replace('upload','public/upload')
          console.log(this.url)
        },
        agreeOffer(){
            const self = this;
            let data = {
                design_id: self.item.id,
                created_by: self.item.design_enginners[0].created_by
            };

                self.loading = true;
                axios
                    .post('estate_owner/acceptDesignRequestOffer', data)
                    .then(function (response) {
                        self.loading = false;
                        if (response.data.success === true) {
                            self.$store.commit('showSnackbar', {
                                message: response.data.msg,
                                color: response.data.success,
                            });
                           self.dialog =false
                           self.$emit('refreshTable',response)
                           self.$forceUpdate()
                        }
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            //self.reset();
        },
         rejectOffer(){
            const self = this;
            let data = {
                design_id: self.item.id,
                created_by: self.item.design_enginners[0].created_by
            };

                self.loading = true;
                axios
                    .post('estate_owner/rejectDesignRequestOffer', data)
                    .then(function (response) {
                        self.loading = false;
                        if (response.data.success === true) {
                            self.$store.commit('showSnackbar', {
                                message: response.data.msg,
                                color: response.data.success,
                            });
                           self.dialog =false
                        }
                    })
                    .catch(function (error) {
                        console.log(error);
                    });
            //self.reset();
        },
        close() {
            const self = this;
            self.loading = false;
            self.dialog = false;
        },
   
    },
};
</script>
