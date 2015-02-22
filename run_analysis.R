
t<- read.table("features.txt")
xtest<- read.table("test\\X_test.txt")
ytest<- read.table("test\\Y_test.txt")
subtest<- read.table("test\\subject_test.txt")
xtrain<- read.table("train\\X_train.txt")
ytrain<- read.table("train\\Y_train.txt")
subtrain<- read.table("train\\subject_train.txt")

activity<- read.table("activity_labels.txt")

xcomb<-rbind(xtest,xtrain)
ycomb<-rbind(ytest,ytrain)
subcomb<-rbind(subtest,subtrain)

colnames(xcomb) <- as.character(t[,2])
colnames(ycomb) <- "Activity_ID"
colnames(subcomb) <- "Subject"
colnames(activity) <- c("Activity_ID","Activity")

meadandstd.data<-cbind(ycomb,xcomb[,grep("mean|std", names(xcomb),ignore.case=TRUE)])

all.data<-cbind(subcomb,merge(activity,meadandstd.data,by="Activity_ID"))
clean.data<-subset(all.data, select=-c(Activity_ID))

mean.data<-aggregate( clean.data[,3:81],clean.data[,1:2], FUN = mean )

write.table(mean.data,"meandata.txt",row.name=FALSE )
