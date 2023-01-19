run Simulink_DataView_asn;

inports_positions  = zeros(1, 4);
bussel_positions   = zeros(1, 4);
outports_positions = zeros(1, 4);
buscre_positions   = zeros(1, 4);

n_outports = 1;

all_inports_created  = false;
all_outports_created = false;

if (exist('get_acceleration', 'file') == 4)
   load_system('get_acceleration');
   inportHan = find_system('get_acceleration','FindAll','on', 'SearchDepth', 1, 'BlockType','Inport');
   outportHan = find_system('get_acceleration','FindAll','on', 'SearchDepth', 1, 'BlockType','Outport');
   all_inports_created  = (length(inportHan) == n_inports);
   all_outports_created = (length(outportHan) == n_outports);
   % ---------------------------------------------------------------------------------
   % start by removing the Bus Selectors / then lines / finally ports
   % ---------------------------------------------------------------------------------
   % get the handles of all the lines connected to inports
   for i=1:length(inportHan)
      inports_positions(i,:) = get_param(inportHan(i),'Position'); % remember Inport's position
      line_structsIn(i)=get_param(inportHan(i),'LineHandles'); % get the structures
      inLinesHan(i)=line_structsIn(i).Outport;        % get the line connected to the block's Outport
      if (inLinesHan(i) ~= -1) % if exists
         dstBlock = get_param(inLinesHan(i),'DstBlockHandle'); % get the destination block's handle
         if (strcmp(get_param(dstBlock,'BlockType'),'BusSelector'))
            bussel_positions(i,:) = get_param(dstBlock,'Position'); % remember Bus Selector's position
            blockLineStructs = get_param(dstBlock,'LineHandles'); % get the line connected structures
            blockLineHandles = blockLineStructs.Outport; % get the line handlers connected to the bus's outports
            for j=1:length(blockLineHandles)
               if (blockLineHandles(j) ~= -1)
                  delete(blockLineHandles(j));
               end
            end
            delete_block(dstBlock); % delete it if it is a Bus Selector Block
         end
         delete(inLinesHan(i)); % delete the respective line
      end
      delete_block(inportHan(i)); % delete the outdated inport block
   end
   % now remove the outports
   for i=1:length(outportHan)
      outports_positions(i,:) = get_param(outportHan(i),'Position'); % remember Outport's position
      line_structsOut(i)=get_param(outportHan(i),'LineHandles'); % get the structures
      outLinesHan(i)=line_structsOut(i).Inport;       % get the line connected to the block's Inport
      if (outLinesHan(i) ~= -1) % if exists
         srcBlock = get_param(outLinesHan(i),'SrcBlockHandle'); % get the source block's handle
         if (strcmp(get_param(srcBlock,'BlockType'),'BusCreator'))
            buscre_positions(i,:) = get_param(srcBlock,'Position'); % remember Bus Creator's position
            blockLineStructs = get_param(srcBlock,'LineHandles'); % get the line connected structures
            blockLineHandles = blockLineStructs.Inport; % get the line handlers connected to the bus's outports
            for j=1:length(blockLineHandles)
                    if (blockLineHandles(j) ~= -1)
                            delete(blockLineHandles(j));
                    end
            end
            delete_block(srcBlock); % delete it if it is a Bus Creator Block
         end
         delete(outLinesHan(i)); % delete the respective line
      end
      delete_block(outportHan(i)); % delete the outdated outport block
   end
else
   new_system('get_acceleration');
   load_system('get_acceleration');
end

% These are the parameters for this Simulink function:
   % Name: acceleration
   % Direction: PARAM_OUT

inport_index = 0;

outport_index = 0;
outport_index = outport_index + 1;
add_block('simulink/Sinks/Out1','get_acceleration/acceleration');
if all_outports_created
   set_param('get_acceleration/acceleration','Position', outports_positions(outport_index,:));
else
   set_param('get_acceleration/acceleration','Position',[430 (outport_index * 100) 460 ((outport_index * 100) + 14)]);
end
set_param('get_acceleration/acceleration','OutDataTypeStr','Acceleration');

set_param('get_acceleration','SaveOutput','off');
set_param('get_acceleration','SignalLogging','off');
set_param('get_acceleration','SaveTime','off')
set_param('get_acceleration','Solver','FixedStepDiscrete');
set_param('get_acceleration','SystemTargetFile','ert.tlc');
set_param('get_acceleration','TemplateMakefile','ert_default_tmf');
set_param('get_acceleration', 'PostCodeGenCommand', 'packNGo(buildInfo);');
set_param('get_acceleration','StrictBusMsg','ErrorLevel1')
save_system('get_acceleration');
close_system('get_acceleration');

n_outports = 1;

all_inports_created  = false;
all_outports_created = false;

if (exist('get_altitude', 'file') == 4)
   load_system('get_altitude');
   inportHan = find_system('get_altitude','FindAll','on', 'SearchDepth', 1, 'BlockType','Inport');
   outportHan = find_system('get_altitude','FindAll','on', 'SearchDepth', 1, 'BlockType','Outport');
   all_inports_created  = (length(inportHan) == n_inports);
   all_outports_created = (length(outportHan) == n_outports);
   % ---------------------------------------------------------------------------------
   % start by removing the Bus Selectors / then lines / finally ports
   % ---------------------------------------------------------------------------------
   % get the handles of all the lines connected to inports
   for i=1:length(inportHan)
      inports_positions(i,:) = get_param(inportHan(i),'Position'); % remember Inport's position
      line_structsIn(i)=get_param(inportHan(i),'LineHandles'); % get the structures
      inLinesHan(i)=line_structsIn(i).Outport;        % get the line connected to the block's Outport
      if (inLinesHan(i) ~= -1) % if exists
         dstBlock = get_param(inLinesHan(i),'DstBlockHandle'); % get the destination block's handle
         if (strcmp(get_param(dstBlock,'BlockType'),'BusSelector'))
            bussel_positions(i,:) = get_param(dstBlock,'Position'); % remember Bus Selector's position
            blockLineStructs = get_param(dstBlock,'LineHandles'); % get the line connected structures
            blockLineHandles = blockLineStructs.Outport; % get the line handlers connected to the bus's outports
            for j=1:length(blockLineHandles)
               if (blockLineHandles(j) ~= -1)
                  delete(blockLineHandles(j));
               end
            end
            delete_block(dstBlock); % delete it if it is a Bus Selector Block
         end
         delete(inLinesHan(i)); % delete the respective line
      end
      delete_block(inportHan(i)); % delete the outdated inport block
   end
   % now remove the outports
   for i=1:length(outportHan)
      outports_positions(i,:) = get_param(outportHan(i),'Position'); % remember Outport's position
      line_structsOut(i)=get_param(outportHan(i),'LineHandles'); % get the structures
      outLinesHan(i)=line_structsOut(i).Inport;       % get the line connected to the block's Inport
      if (outLinesHan(i) ~= -1) % if exists
         srcBlock = get_param(outLinesHan(i),'SrcBlockHandle'); % get the source block's handle
         if (strcmp(get_param(srcBlock,'BlockType'),'BusCreator'))
            buscre_positions(i,:) = get_param(srcBlock,'Position'); % remember Bus Creator's position
            blockLineStructs = get_param(srcBlock,'LineHandles'); % get the line connected structures
            blockLineHandles = blockLineStructs.Inport; % get the line handlers connected to the bus's outports
            for j=1:length(blockLineHandles)
                    if (blockLineHandles(j) ~= -1)
                            delete(blockLineHandles(j));
                    end
            end
            delete_block(srcBlock); % delete it if it is a Bus Creator Block
         end
         delete(outLinesHan(i)); % delete the respective line
      end
      delete_block(outportHan(i)); % delete the outdated outport block
   end
else
   new_system('get_altitude');
   load_system('get_altitude');
end

% These are the parameters for this Simulink function:
   % Name: altitude
   % Direction: PARAM_OUT

inport_index = 0;

outport_index = 0;
outport_index = outport_index + 1;
add_block('simulink/Sinks/Out1','get_altitude/altitude');
if all_outports_created
   set_param('get_altitude/altitude','Position', outports_positions(outport_index,:));
else
   set_param('get_altitude/altitude','Position',[430 (outport_index * 100) 460 ((outport_index * 100) + 14)]);
end
set_param('get_altitude/altitude','OutDataTypeStr','Altitude');

set_param('get_altitude','SaveOutput','off');
set_param('get_altitude','SignalLogging','off');
set_param('get_altitude','SaveTime','off')
set_param('get_altitude','Solver','FixedStepDiscrete');
set_param('get_altitude','SystemTargetFile','ert.tlc');
set_param('get_altitude','TemplateMakefile','ert_default_tmf');
set_param('get_altitude', 'PostCodeGenCommand', 'packNGo(buildInfo);');
set_param('get_altitude','StrictBusMsg','ErrorLevel1')
save_system('get_altitude');
close_system('get_altitude');

n_outports = 1;

all_inports_created  = false;
all_outports_created = false;

if (exist('get_velocity', 'file') == 4)
   load_system('get_velocity');
   inportHan = find_system('get_velocity','FindAll','on', 'SearchDepth', 1, 'BlockType','Inport');
   outportHan = find_system('get_velocity','FindAll','on', 'SearchDepth', 1, 'BlockType','Outport');
   all_inports_created  = (length(inportHan) == n_inports);
   all_outports_created = (length(outportHan) == n_outports);
   % ---------------------------------------------------------------------------------
   % start by removing the Bus Selectors / then lines / finally ports
   % ---------------------------------------------------------------------------------
   % get the handles of all the lines connected to inports
   for i=1:length(inportHan)
      inports_positions(i,:) = get_param(inportHan(i),'Position'); % remember Inport's position
      line_structsIn(i)=get_param(inportHan(i),'LineHandles'); % get the structures
      inLinesHan(i)=line_structsIn(i).Outport;        % get the line connected to the block's Outport
      if (inLinesHan(i) ~= -1) % if exists
         dstBlock = get_param(inLinesHan(i),'DstBlockHandle'); % get the destination block's handle
         if (strcmp(get_param(dstBlock,'BlockType'),'BusSelector'))
            bussel_positions(i,:) = get_param(dstBlock,'Position'); % remember Bus Selector's position
            blockLineStructs = get_param(dstBlock,'LineHandles'); % get the line connected structures
            blockLineHandles = blockLineStructs.Outport; % get the line handlers connected to the bus's outports
            for j=1:length(blockLineHandles)
               if (blockLineHandles(j) ~= -1)
                  delete(blockLineHandles(j));
               end
            end
            delete_block(dstBlock); % delete it if it is a Bus Selector Block
         end
         delete(inLinesHan(i)); % delete the respective line
      end
      delete_block(inportHan(i)); % delete the outdated inport block
   end
   % now remove the outports
   for i=1:length(outportHan)
      outports_positions(i,:) = get_param(outportHan(i),'Position'); % remember Outport's position
      line_structsOut(i)=get_param(outportHan(i),'LineHandles'); % get the structures
      outLinesHan(i)=line_structsOut(i).Inport;       % get the line connected to the block's Inport
      if (outLinesHan(i) ~= -1) % if exists
         srcBlock = get_param(outLinesHan(i),'SrcBlockHandle'); % get the source block's handle
         if (strcmp(get_param(srcBlock,'BlockType'),'BusCreator'))
            buscre_positions(i,:) = get_param(srcBlock,'Position'); % remember Bus Creator's position
            blockLineStructs = get_param(srcBlock,'LineHandles'); % get the line connected structures
            blockLineHandles = blockLineStructs.Inport; % get the line handlers connected to the bus's outports
            for j=1:length(blockLineHandles)
                    if (blockLineHandles(j) ~= -1)
                            delete(blockLineHandles(j));
                    end
            end
            delete_block(srcBlock); % delete it if it is a Bus Creator Block
         end
         delete(outLinesHan(i)); % delete the respective line
      end
      delete_block(outportHan(i)); % delete the outdated outport block
   end
else
   new_system('get_velocity');
   load_system('get_velocity');
end

% These are the parameters for this Simulink function:
   % Name: velocity
   % Direction: PARAM_OUT

inport_index = 0;

outport_index = 0;
outport_index = outport_index + 1;
add_block('simulink/Sinks/Out1','get_velocity/velocity');
if all_outports_created
   set_param('get_velocity/velocity','Position', outports_positions(outport_index,:));
else
   set_param('get_velocity/velocity','Position',[430 (outport_index * 100) 460 ((outport_index * 100) + 14)]);
end
set_param('get_velocity/velocity','OutDataTypeStr','Velocity');

set_param('get_velocity','SaveOutput','off');
set_param('get_velocity','SignalLogging','off');
set_param('get_velocity','SaveTime','off')
set_param('get_velocity','Solver','FixedStepDiscrete');
set_param('get_velocity','SystemTargetFile','ert.tlc');
set_param('get_velocity','TemplateMakefile','ert_default_tmf');
set_param('get_velocity', 'PostCodeGenCommand', 'packNGo(buildInfo);');
set_param('get_velocity','StrictBusMsg','ErrorLevel1')
save_system('get_velocity');
close_system('get_velocity');
