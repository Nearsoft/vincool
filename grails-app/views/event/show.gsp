<g:applyLayout name="simple">

    <content tag="head">

    </content>

    <content tag="boxTitle">
        <h3>Event Detail</h3>
    </content>

    <content tag="boxContent">
        <div class="row">
            <div class="col-lg-12">
                <div class="m-b-md">
                    <a href="#" class="btn btn-white btn-xs pull-right">Edit project</a>
                    <h2>${event.eventCategory.subCategory}</h2>
                </div>
                <dl class="dl-horizontal">
                    <dt>Status:</dt> <dd><span class="label label-primary">Active</span></dd>
                </dl>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-5">
                <dl class="dl-horizontal">
                    <dt>Category:</dt> <dd>${event.eventCategory.category}</dd>
                    <dt>Type:</dt> <dd>${event.type}</dd>
                    <dt>Description:</dt> <dd>${event.description}</dd>
                </dl>
            </div>
            <div class="col-lg-7" id="cluster_info">
                <dl class="dl-horizontal" >

                    <dt>Location:</dt> <dd>${event.office}</dd>
                    <dt>Date:</dt> <dd>${event.date} at ${event.time}</dd>
                    <dt>Calendar Color:</dt> <dd>${event.eventCategory.color}</dd>
                    <dt>Attendees:</dt>
                    <dd class="project-people">
                        <g:if test="${eventDetails.attendeesPictures.isEmpty()}">
                            No attendees for the moment
                        </g:if>
                        <g:else>
                            <g:each in="${eventDetails.attendeesPictures}" var="url" >
                                <g:if test="${url == null}">
                                    <asset:image src="default_user.svg" class="img-circle" />
                                </g:if>
                                <g:else>
                                    <img alt="image" class="img-circle" src="${url}">
                                </g:else>
                            </g:each>
                        </g:else>
                    </dd>
                </dl>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <dl class="dl-horizontal">
                    <dt>Assistance Percentage:</dt>
                    <dd>
                        <div class="progress progress-striped active m-b-sm">
                            <div style="width: ${eventDetails.assistancePercentage}%;" class="progress-bar"></div>
                        </div>
                        <small><strong>${eventDetails.assistancePercentage}%</strong> of the enrolled attendees assisted to this event.</small>
                    </dd>
                </dl>
            </div>
        </div>

        <div class="row m-t-sm">
            <div class="col-lg-12">
                <div class="panel blank-panel">
                    <div class="panel-heading">
                        <div class="panel-options">
                            <ul class="nav nav-tabs">
                                <li class="active"><a href="#tab-1" data-toggle="tab">Enrollments</a></li>
                                <li class=""><a href="#tab-2" data-toggle="tab">Resources</a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="panel-body">

                        <div class="tab-content">
                            <div class="tab-pane active" id="tab-1">
                                <div class="feed-activity-list">
                                    <g:each in="${eventDetails.enrollments}" var="enrollment">
                                        <div class="feed-element">
                                            <a href="#" class="pull-left">
                                                <g:if test="${enrollment.attendee.profilePictureUrl == null}">
                                                    <asset:image src="default_user.svg" class="img-circle" />
                                                </g:if>
                                                <g:else>
                                                    <img alt="image" class="img-circle" src="${enrollment.attendee.profilePictureUrl}">
                                                </g:else>
                                            </a>
                                            <div class="body ">
                                                <g:if test="${enrollment.attendance}">
                                                    <span class="label label-primary pull-right"><i class="fa fa-check"></i> Assisted</span>
                                                </g:if>
                                                <g:else>
                                                    <span class="label label pull-right"><i class="fa fa-close"></i> Not Assisted</span>
                                                </g:else>
                                                <strong>${enrollment.attendee.name}</strong> <br>
                                            </div>
                                        </div>
                                    </g:each>
                                </div>
                            </div>

                            <div class="tab-pane" id="tab-2">

                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Description</th>
                                        <th>
                                            Url
                                            <g:link controller="resource" action="create" id="${event.id}" class="btn btn-sm button btn-outline btn-primary pull-right">
                                                <i class="fa fa-check"></i> Add a new resource

                                            </g:link>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                        <g:each in="${event.resources}" var="resource">
                                            <tr>
                                                <td>${resource.name}</td>
                                                <td>${resource.description}</td>
                                                <td>${resource.url}</td>
                                            </tr>
                                        </g:each>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </content>

    <content tag="breadcrumbs">
    </content>

</g:applyLayout>