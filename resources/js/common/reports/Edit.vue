<template id="panel-template">
    <v-container justify-center>
        <v-card-actions justify-left>
            <v-btn style="color: #06706d" @click="$router.go(-1)">
                {{ trans('messages.back') }}
            </v-btn>
            <!-- <v-btn style="color: #06706d" @click="externalDialog = true">
                {{ trans('data.reports_review') }}
            </v-btn>-->
            <v-btn
                style="background-color: #06706d; color: white"
                color="darken-1"
                @click="print"
                :loading="loading"
                :disabled="loading"
            >
                {{ trans('data.print') }}
            </v-btn>
        </v-card-actions>
        <v-spacer></v-spacer>
        <v-card onafterprint="myFunction()">
            <v-divider></v-divider>
                
                    <ReportForm :reportType="report_type" :edit="true" :report="report" :office="office" />
        </v-card>
        <AddReportType :externalDialog="externalDialog" @close="externalDialog = event" @store="externalDialog = event" />
    </v-container>
</template>
<script>
import AddReportType from '../report_types/Add.vue'
import ReportForm from './components/ReportForm.vue'
export default {
    components:{
     AddReportType,
     ReportForm
    },
    data() {
        return {
            type: 'testt',
            externalDialog: false,
            project: null,
            description: '',
            name: '',
            offices: [],
            office: null,
            report_types: [],
            report_type: '',
            create_time: '',
             loading:false,
            enable_report: false,
            report: null
        };
    },
    created() {
        const self = this;
        self.reset();
        self.getReportTypes();
        self.report = self.$route.params.report
    },
    beforeDestroy() {
        const self = this;
    },
    mounted: function () {},
    methods: {
    
        getFields(input, field) {
            var output = [];

            for (var i = 0; i < input.length; ++i) output.push(input[i][field]);
            return output.join('&&');
        },
        getReportTypes() {
            const self = this;
            axios
                .get('/get-report-types')
                .then(function (response) {
                    self.report_types = response.data.types;
                    self.offices = response.data.offices
                    console.log(response.data)
                })
                .catch(function (error) {
                    console.log(error);
                });
        },

        reset() {
            const self = this;
            self.title = '';
            self.request_type = '';
            self.project_id = '';
            self.description = '';
            self.status = '';
            self.priority = '';
            self.customer_id = '';
           
            // self.request_types=[];
        },

      
         print() {
            const self = this;
            self.$validator.validateAll().then((result) => {
                if (result == true) {
                    // Pass the element id here
                   // document.getElementById('input_name').setAttribute('value', this.name);
                    document
                        .getElementById('input_report_type')
                        .setAttribute('value', 'Kick Of Project');

                    //alert(this.report_type)
                    // Get HTML to print from element
                    const prtHtml = document.getElementById('printMe').innerHTML;

                    // Get all stylesheets HTML
                    let stylesHtml = '';
                    for (const node of [
                        ...document.querySelectorAll('link[rel="stylesheet"], style'),
                    ]) {
                        stylesHtml += node.outerHTML;
                    }
                    stylesHtml +=
                        '<style type="text/css">.v-icon {\n  display: none;\n}}\n</style>';
                    //

                    // Open the print window
                    const WinPrint = window.open(
                        '',
                        '',
                        'left=0,top=0,width=1020,height=900,toolbar=0,scrollbars=0,status=0'
                    );

                    WinPrint.document.write(`<!DOCTYPE html>
                    <html>
                    <head>
                        ${stylesHtml}
                        
                    </head>
                    <body>
                        ${prtHtml}
                    </body>
                    </html>`);

                    //  await this.$htmlToPaper('printMe');
                    WinPrint.document.close();

                    WinPrint.focus();

                    WinPrint.print();
                    WinPrint.close();
                    this.store();
                }
            });
        },
      

        enableReport(value) {
            const self = this;
            self.enable_report = true;
            console.log(this.report_type)
           // self.$forceUpdate()
        },
    },
};
</script>

<style scoped>
.card {
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid rgba(0, 0, 0, 0.125);
    border-radius: 0.5rem;
}
.card > hr {
    margin-right: 0;
    margin-left: 0;
}
.card > .list-group {
    border-top: inherit;
    border-bottom: inherit;
}
.card > .list-group:first-child {
    border-top-width: 0;
    border-top-left-radius: calc(0.25rem - 1px);
    border-top-right-radius: calc(0.25rem - 1px);
}
.card > .list-group:last-child {
    border-bottom-width: 0;
    border-bottom-right-radius: calc(0.25rem - 1px);
    border-bottom-left-radius: calc(0.25rem - 1px);
}
.card > .card-header + .list-group,
.card > .list-group + .card-footer {
    border-top: 0;
}

.card-body {
    flex: 1 1 auto;
    padding: 1rem 1rem;
    background-color: rgba(217, 217, 217, 255);
}

.card-title {
    margin-bottom: 0.5rem;
}

.card-subtitle {
    margin-top: -0.25rem;
    margin-bottom: 0;
}

.card-text:last-child {
    margin-bottom: 0;
}

.card-link + .card-link {
    margin-left: 1rem;
}

.card-header {
    padding: 0.5rem 1rem;
    margin-bottom: 0;
    background-color: rgba(12, 111, 109, 255);
    border-bottom: 1px solid rgba(0, 0, 0, 0.125);
    color: white;
}
.card-header:first-child {
    border-radius: calc(0.25rem - 1px) calc(0.25rem - 1px) 0 0;
}

.card-footer {
    padding: 0.5rem 1rem;
    background-color: rgba(0, 0, 0, 0.03);
    border-top: 1px solid rgba(0, 0, 0, 0.125);
}
.card-footer:last-child {
    border-radius: 0 0 calc(0.25rem - 1px) calc(0.25rem - 1px);
}

.card-header-tabs {
    margin-right: -0.5rem;
    margin-bottom: -0.5rem;
    margin-left: -0.5rem;
    border-bottom: 0;
}
.card-text {
    text-align: -webkit-center;
}

.card-header-pills {
    margin-right: -0.5rem;
    margin-left: -0.5rem;
}

.card-img-overlay {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    padding: 1rem;
    border-radius: calc(0.25rem - 1px);
}

.card-img,
.card-img-top,
.card-img-bottom {
    width: 100%;
}

.card-img,
.card-img-top {
    border-top-left-radius: calc(0.25rem - 1px);
    border-top-right-radius: calc(0.25rem - 1px);
}

.card-img,
.card-img-bottom {
    border-bottom-right-radius: calc(0.25rem - 1px);
    border-bottom-left-radius: calc(0.25rem - 1px);
}

.card-group > .card {
    margin-bottom: 0.75rem;
}
@media (min-width: 576px) {
    .card-group {
        display: flex;
        flex-flow: row wrap;
    }
    .card-group > .card {
        flex: 1 0 0%;
        margin-bottom: 0;
    }
    .card-group > .card + .card {
        margin-left: 0;
        border-left: 0;
    }
    .card-group > .card:not(:last-child) {
        border-top-right-radius: 0;
        border-bottom-right-radius: 0;
    }
    .card-group > .card:not(:last-child) .card-img-top,
    .card-group > .card:not(:last-child) .card-header {
        border-top-right-radius: 0;
    }
    .card-group > .card:not(:last-child) .card-img-bottom,
    .card-group > .card:not(:last-child) .card-footer {
        border-bottom-right-radius: 0;
    }
    .card-group > .card:not(:first-child) {
        border-top-left-radius: 0;
        border-bottom-left-radius: 0;
    }
    .card-group > .card:not(:first-child) .card-img-top,
    .card-group > .card:not(:first-child) .card-header {
        border-top-left-radius: 0;
    }
    .card-group > .card:not(:first-child) .card-img-bottom,
    .card-group > .card:not(:first-child) .card-footer {
        border-bottom-left-radius: 0;
    }
}
</style>