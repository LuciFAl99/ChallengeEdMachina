<template>
    <div class="components">
        <div class="details">
            <p class="record-details">Record Details / {{ jsonData.id }}</p>
            <p class="icon-outline">
                <button><v-icon>mdi mdi-view-dashboard-edit-outline</v-icon></button>
            </p>
        </div>
        <div class="titles">
            <a href="#"
                :class="{ 'active': currentPage === 'overview', 'custom-color': currentPage === 'academic' || currentPage === 'enrollment' }">Overview</a>
            <a href="#" :class="{ 'custom-color': currentPage === 'overview' || currentPage === 'academic' }">Enrollment</a>
            <a href="#" :class="{ 'custom-color': currentPage === 'overview' || currentPage === 'enrollment' }">Academic</a>
        </div>
        <v-divider></v-divider>
        <div class="overview">
            <v-card class="overview2" v-for="item in details">
                <div class="record-age">
                    <div class="icon-background">
                        <v-icon color="white">{{ item.icon }}</v-icon>
                    </div>
                    <div v-show="item.recordAge">
                        <p class="record-age2">Record Age </p>
                        <p class="record-age3"> {{ item.recordAge }}</p>
                    </div>
                    <div v-show="item.status">
                        <p class="record-age2">Status<span class="mdi mdi-cog status"></span>
                        <p class="record-age3"> {{ item.status }}</p>
                        </p>
                    </div>
                    <div v-show="item.country">
                        <p class="record-age2 country">Country
                        <p class="record-age3"> {{ item.country }}</p>
                        </p>
                    </div>
                    <div v-show="item.lastContact">
                        <p class="record-age2 country">Last Contact
                        <p class="record-age3"> {{ item.lastContact }}</p>
                        </p>
                    </div>
                    <div v-show="item.lastActivity">
                        <p class="record-age2 country">Last Activity
                        <p class="record-age3"> {{ item.lastActivity }}</p>
                        </p>
                    </div>


                </div>
                <v-divider></v-divider>
                <div class="created-on" v-show="item.createdOn">
                    <p>Created On</p>
                    <p>{{ item.createdOn }}</p>
                </div>
                <div class="created-on" v-show="item.updated">
                    <p>Updated</p>
                    <p class="updated">{{ item.updated }}</p>
                </div>
                <div class="created-on" v-show="item.state">
                    <p>State</p>
                    <p class="state">{{ item.state }}</p>
                </div>
                <div class="created-on" v-show="item.lastContact || item.lastActivity">
                    <p>{{ item.date }}</p>
                    <p class="hour">{{ item.hour }}</p>
                </div>

            </v-card>
        </div>
        <div class="d-flex flex-column">
            <div class="activity">
                <button>
                    <p>Activity</p>
                </button>
                <button class="emails">
                    <p><v-icon>mdi-email</v-icon>Emails</p>
                </button>
                <button class="emails">
                    <p><v-icon>mdi mdi-phone</v-icon>Calls</p>
                </button>
            </div>
            <div style="background-color: white;" class="linea">
                <div class="timeline">
                    <p class="timeline-p">Timeline</p>
                    <div class="timeline-select">
                        <div class="custom-select">
                            <select class="selects" v-model="selectedYear" @change="filteredTimeline"
                                style="width: 84px; height: 38px;">
                                <option value="">Year</option>
                                <option value='2022'>2022</option>
                                <option value='2023'>2023</option>
                            </select>
                            <span class="mdi mdi-menu-down arrow-down"></span>
                        </div>
                        <div class="custom-select">
                            <select class="selects" style="width: 140px;height: 38px;">
                                <option>Filter by User</option>
                                <option class="option"></option>
                            </select>
                            <span class="mdi mdi-menu-down"></span>
                        </div>
                        <div class="custom-select">
                            <input class="selects" v-model="searchTerm" @input="filterItems" @keyup.enter="filterItems"
                                style="width: 243px;height: 38px;" type="text" placeholder="Search" />
                            <span class="mdi mdi-magnify"></span>
                        </div>

                    </div>
                </div>
                <div class="timeline-template">
                    <template>
                        <v-container>
                            <v-row justify="start">
                                <v-col cols="12" sm="8">
                                    <v-timeline>
                                        <div v-show="timelineSeptember.length === 0 && timelineAugust.length === 0 && timelineJuly.length === 0 && timelineJune.length === 0" style="width: 200px;">
                                            <p class="results">Results not found</p>
                                        </div>
                                        <p class="month" v-if="timelineSeptember.length > 0">September 2023</p>
                                        <div v-for="item in timelineSeptember" style="margin-bottom: -18px;">
                                            <v-timeline-item>
                                                <template v-slot:icon>
                                                    <v-avatar color="#7367F0" size="36">
                                                        <v-icon style="font-size: 25px; border: 2px solid #DDDDDD;"
                                                            color="white">{{ item.icon }}</v-icon>
                                                    </v-avatar>
                                                </template>
                                                <div class="actions" style="background-color: #F0F0F0;">
                                                    <div class="d-flex justify-space-between">
                                                        <p><span style="color: #7367F0;">{{ item.action }}</span> by
                                                            {{ item.by }}</p>
                                                        <p>{{ item.date }}</p>
                                                    </div>
                                                    <p> {{ item.content }} <span style="color: #7367F0;">{{ item.status
                                                    }}</span></p>
                                                </div>
                                            </v-timeline-item>
                                        </div>
                                        <p class="month" v-if="timelineAugust.length > 0">August 2023</p>
                                        <div v-for="(item, index) in timelineAugust" style="margin-bottom: -18px;">
                                            <v-timeline-item>
                                                <template v-slot:icon>
                                                    <v-avatar color="#7367F0"
                                                        :size="index === 2 || index === 3 ? '18' : '36'">
                                                        <v-icon style="font-size: 25px; border: 2px solid #DDDDDD;"
                                                            color="white">{{ item.icon }}</v-icon>
                                                    </v-avatar>
                                                </template>
                                                <div :class="['actions', { 'first-august-item': index === 0 }, { 'call': index === 1 }, { 'actionsResponsive': index === 2 }]"
                                                    style="background-color: #F0F0F0;">
                                                    <div class="d-flex justify-space-between">
                                                        <p v-if="item.by && item.from"><span style="color: #7367F0;">{{
                                                            item.action }} </span>from {{ item.from }} by {{ item.by }}
                                                        </p>
                                                        <p v-else-if="item.from"><span style="color: #7367F0;">{{
                                                            item.action }} </span>from {{ item.from }}</p>
                                                        <p v-else="item.by"><span style="color: #7367F0;">{{ item.action }}
                                                            </span>by {{ item.by }}</p>
                                                        <p>{{ item.date }}</p>
                                                    </div>
                                                    <div v-show="index === 0">
                                                        <p class="for">For: {{ item.for }}</p>
                                                        <p class="for">Assignment Name: {{ item.assignmentName }}</p>
                                                        <p class="for">Grade: {{ item.grade }}</p>
                                                    </div>
                                                    <p style="height: 6px;">{{ item.content }} <span
                                                            style="color: #7367F0;">{{ item.status
                                                            }} </span>
                                                    </p>
                                                    <p v-show="index === 1" style="height: 8px;"> Call Duration: {{
                                                        item.callDuration }}
                                                    </p>
                                                </div>
                                            </v-timeline-item>
                                        </div>
                                        <p class="month" v-if="timelineJuly.length > 0">July 2023</p>
                                        <div v-for="item in timelineJuly" style="margin-bottom: -18px;">
                                            <v-timeline-item>
                                                <template v-slot:icon>
                                                    <v-avatar color="#7367F0" size="36">
                                                        <v-icon style="font-size: 25px; border: 2px solid #DDDDDD;"
                                                            color="white">{{ item.icon }}</v-icon>
                                                    </v-avatar>
                                                </template>
                                                <div class="actions" style="background-color: #F0F0F0; height: 87px;">
                                                    <div class="d-flex justify-space-between">
                                                        <p><span style="color: #7367F0;">{{ item.action }}</span> by
                                                            {{ item.from }}</p>
                                                        <p>{{ item.date }}</p>
                                                    </div>
                                                    <p style="height: 8px;"> {{ item.content }}</p>
                                                    <p style="height: 8px;">Call Duration: {{ item.callDuration }}</p>
                                                </div>
                                            </v-timeline-item>
                                        </div>
                                        <p class="month" v-if="timelineJune.length > 0">June 2023</p>
                                        <div v-for="item in timelineJune" style="margin-bottom: -18px;">
                                            <v-timeline-item>
                                                <template v-slot:icon>
                                                    <v-avatar color="#7367F0" size="36">
                                                        <v-icon style="font-size: 25px; border: 2px solid #DDDDDD;"
                                                            color="white">{{ item.icon }}</v-icon>
                                                    </v-avatar>
                                                </template>
                                                <div class="actions" style="background-color: #F0F0F0;">
                                                    <div class="d-flex justify-space-between">
                                                        <p><span style="color: #7367F0;">{{ item.action }}</span> by
                                                            {{ item.by }}</p>
                                                        <p>{{ item.date }}</p>
                                                    </div>
                                                    <p style="height: 8px;"> {{ item.content }} <span
                                                            style="color: #7367F0;">{{ item.status
                                                            }} </span></p>
                                                </div>
                                            </v-timeline-item>
                                        </div>
                                    </v-timeline>
                                </v-col>
                            </v-row>
                        </v-container>
                    </template>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
import { jsonData } from '../json/menu';
import { timeline } from '../json/timeline';
export default {
    data() {
        return {
            jsonData: null,
            timeline: null,
            currentPage: 'overview',
            items: [],
            details: jsonData.students[0].details,
            timelineSeptember: timeline.september,
            timelineAugust: timeline.august,
            timelineJuly: timeline.july,
            timelineJune: timeline.june,
            searchTerm: '',
            selectedYear: ''

        };
    },
    mounted() {
        this.jsonData = jsonData.students[0];
        this.details = jsonData.students[0].details;
        this.lastContact = jsonData.students[0].details.lastContatct;
        this.lastActivity = jsonData.students[0].details.lastActivity;
    },
    methods: {
        filterItems() {
            const term = this.searchTerm.toLowerCase();

            // Filtra la lista de septiembre
            this.timelineSeptember = timeline.september.filter(item => {
                // Convierte el objeto en una cadena y busca el término
                return JSON.stringify(item).toLowerCase().includes(term);
            });

            // Filtra la lista de agosto
            this.timelineAugust = timeline.august.filter(item => {
                return JSON.stringify(item).toLowerCase().includes(term);
            });

            // Filtra la lista de julio
            this.timelineJuly = timeline.july.filter(item => {
                return JSON.stringify(item).toLowerCase().includes(term);
            });

            // Filtra la lista de junio
            this.timelineJune = timeline.june.filter(item => {
                return JSON.stringify(item).toLowerCase().includes(term);
            });
        },
        filteredTimeline() {
            this.timelineSeptember = timeline.september.filter(item => {
                return JSON.stringify(item).toLowerCase().includes(this.selectedYear);
            });
            this.timelineAugust = timeline.august.filter(item => {
                return JSON.stringify(item).toLowerCase().includes(this.selectedYear);
            });
            this.timelineJuly = timeline.july.filter(item => {
                return JSON.stringify(item).toLowerCase().includes(this.selectedYear);
            });
            this.timelineJune = timeline.june.filter(item => {
                return JSON.stringify(item).toLowerCase().includes(this.selectedYear);
            });

        }

    }
}
</script>
<style>
@import '../assets/Style/details.css';
</style>