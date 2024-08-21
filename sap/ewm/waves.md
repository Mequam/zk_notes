---
id: ltnlpa0t63rjvurwnm5lxk
title: sap/ewm/waves
desc: ''
updated: 1724271756
created: 1724271756
---
# sap/ewm/waves

## About

these are grouping of warehouse request items, these groupings are then processed together

think waves of minions,

"waves are not possible for inbound delivery items" -sap

SAP Extended Warehouse Management can combine warehouse request items and split
items into waves based on criteria such as activity area, route,
or product. You can create waves automatically or manually using existing
wave templates. If you want to create a wave manually, on
the EWM Index screen, choose Extended Warehouse Management → Work Scheduling
→ Wave Management → /SCWM/WAVE Maintain Waves, and then choose Create.
SAP EWM creates an empty wave. You enter the remaining information
manually such as the assignment of warehouse request items.



## Wave Template Schema


A wave template is a schema that defines the attributes of
all the waves that are based on it. It serves as
the infrastructure for automatic wave assignment. Wave templates enable the same
wave attributes to be reused for different warehouse request items that
comply with the same conditions. You can also use wave templates
to create waves manually, or, in the case of automatic wave
assignment, to assign items or split items from the warehouse requests
to existing waves that are based on the wave templates.

The following attributes are available for wave templates:

- Release method: (with the possible values Automatic, Immediate, and Manual)
- Wave type: (enables specific monitoring in the Warehouse Management Monitor)
- Wave category: (you can use as a filter for warehouse order creation rules)
- Wave assignment is also possible after wave release: indicator ( 
        you can use to assign additional warehouse request items to a wave that has already been released)
- Control for bin denial: This allows you to choose between the following options:
    - You can leave an item in a wave, or, in other words, release it again later.
    - You can remove an item from a wave, or, in other words, reassign the item.
    - You can have the system immediately create a warehouse task with an alternative source bin.
- Wave Release Retry Interval:
    If you set a retry interval for a wave template,
    the system automatically schedules a new wave release job when a wave
    using the template can not create all warehouse tasks due to
    missing stock. You can specify the retry interval in minutes for
    when the system should schedule the new wave release job. If
    there is no retry interval, the system does not create a new
    wave release job.


### Automatic Wave Assignment

you can configure warehouse requests to automatically be assigned to a wave upon creation

you need to have wave templates, and a properly configured system for this to work propperly


### Wave Operations

you can DO THINGS to waves to change them in the system


"surfs up dooode" (you can tell what time of day I make these notes by
how sain they ary :p)

here is a lost of operations provided by SAP that you can perform on any
given wave

- Lock or unlock:

    You can lock a wave with the status I (initial). The status of the wave becomes H (locked). When you unlock a wave, EWM resets the status of the wave to I. You cannot release locked waves automatically.
- Merge:
    You can merge as many waves as you want. The prerequisites are:
        The waves have not yet been released, in other words, they have the status I (initial, wave is created) or H (hold, wave is locked).
        All the waves have the same status, either I, or H.

    EWM assigns warehouse request items to the waves. When you merge waves, EWM assigns all the warehouse request items for the selected waves to the first wave selected. EWM always uses the name of the top row. For example, you have waves 123, 456, and 789. If you select and merge these waves, EWM merges these three waves into wave 123.

- Release: Waves are used to create warehouse tasks and warehouse orders. They can be released in the following ways:
    - Automatically: EWM creates a job that automatically releases waves on the release day and at the release time.
    - Immediately: When you or EWM create a wave, EWM releases this wave immediately.
    - Manually: You can manually release a wave at any point in time
        in the monitor or in wave processing. When you manually release
        waves, you can also release locked waves. In this case, EWM
        sets the status Locked for the warehouse orders created. As a result,
        these warehouse orders are locked for further processing for the time being.
        When you or EWM release a wave to generate warehouse tasks,
        
        EWM copies the staging area and the mode of the wave
        to the warehouse tasks. You can release waves multiple times. For
        example, if you release a wave, but EWM can only generate
        some of the required warehouse tasks since there is not enough
        stock, you can release the wave again at a later point
        in time. You can display the log by using the Release
        Log button. To do so, on the EWM Index screen, choose
        Extended Warehouse Management → Work Scheduling → Wave Management → Maintain
        Waves.
- Subsystem:
    You can release a wave for a downstream
    subsystem. As a result, EWM transfers the warehouse orders to the
    downstream subsystem.
- Assign or remove assignment:

    You can assign warehouse
    request items to a wave or remove the assignment. Here, the
    lock time for the wave must not have expired yet. Moreover,
    the wave must not have been released yet. If you have
    set the Wave Assignment Also Possible After Wave Release indicator as
    an attribute in the wave template, you can, however, assign an
    additional warehouse request item to waves that have already been released.

- Split:
    You can select a warehouse request item and
    remove it from the current wave. EWM creates a copy of
    the wave and assigns the warehouse request item to the copy.

- Assign automatically:
    EWM automatically assigns the chosen warehouse request
    items to waves, using the same logic as for the automatic
    wave assignment.
- Delete:
    When EWM deletes a wave, it removes
    the assignment of all the warehouse request items to the wave.
    EWM deletes a wave completely; in other words, you can no
    longer archive it.
- Wave Release Simulation: Details are described in SAP Note 2783735 - EWM Wave Release Simulation.
    > This
    > enhancement was not standard yet for SAP S/4HANA 1909 and is
    > not implemented in our training system, but the note can be
    > implemented in earlier releases.
