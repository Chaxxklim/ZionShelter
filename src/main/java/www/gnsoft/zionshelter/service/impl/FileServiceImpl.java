package www.gnsoft.zionshelter.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import www.gnsoft.zionshelter.mapper.FileMapper;
import www.gnsoft.zionshelter.service.FileService;

@Service
public class FileServiceImpl implements FileService {

    private FileMapper fileMapper;

    @Autowired
    public FileServiceImpl(FileMapper fileMapper){
        this.fileMapper = fileMapper;
    }



}
