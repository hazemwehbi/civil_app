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
                    <v-btn color="green darken-1" flat @click="close">
                        {{ trans('data.reject') }}
                    </v-btn>
                    <v-btn
                        color="success"
                        @click="update"
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
            console.log(item)
          this.dialog =true
          this.url = item.design_enginners[0].media[0].original_url
        },
        update(){

        },
        close() {
            const self = this;
            self.loading = false;
            self.dialog = false;
        },
   
    },
};
</script>
